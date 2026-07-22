import 'package:course_player_app/core/services/playback_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  late PlaybackService playbackService;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});
    playbackService = PlaybackService();
  });

  test('should save and retrieve playback position', () async {
    await playbackService.savePosition(courseId: 'c001', seconds: 15);

    final result = await playbackService.getSavedPosition('c001');

    expect(result, 15);
  });
  test('should return 0 when no saved position exists', () async {
    final result = await playbackService.getSavedPosition('c001');

    expect(result, 0);
  });
}
