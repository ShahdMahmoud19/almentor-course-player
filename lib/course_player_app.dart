import 'package:course_player_app/course_list/presentation/screens/course_list_screen.dart';
import 'package:flutter/material.dart';

class CoursePlayerApp extends StatelessWidget {
  const CoursePlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CourseListScreen(),
    );
  }
}
