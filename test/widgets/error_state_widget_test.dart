import 'package:course_player_app/course_detail/presentation/widgets/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('should display title, subtitle and retry button', (
    tester,
  ) async {
    bool retryPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ErrorStateWidget(
            icon: Icons.wifi_off,
            title: 'No Internet',
            subtitle: 'Please check your connection.',
            onRetry: () {
              retryPressed = true;
            },
          ),
        ),
      ),
    );

    expect(find.text('No Internet'), findsOneWidget);

    expect(find.text('Please check your connection.'), findsOneWidget);

    expect(find.text('Retry'), findsOneWidget);
    await tester.tap(find.text('Retry'));
    await tester.pump();

    expect(retryPressed, isTrue);
  });
}
