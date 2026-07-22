import 'package:course_player_app/core/helper/format_duration_helper.dart';
import 'package:course_player_app/core/services/course_service.dart';
import 'package:course_player_app/core/theme/app_colors.dart';
import 'package:course_player_app/course_detail/presentation/cubit/course_detail_cubit.dart';
import 'package:course_player_app/course_detail/presentation/screens/course_detail_screen.dart';
import 'package:course_player_app/course_list/presentation/widgets/image_widget.dart';
import 'package:course_player_app/course_list/presentation/widgets/course_progress_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseListScreen extends StatefulWidget {
  const CourseListScreen({super.key});

  @override
  State<CourseListScreen> createState() => _CourseListScreenState();
}

class _CourseListScreenState extends State<CourseListScreen> {
  @override
  Widget build(BuildContext context) {
    final courses = CourseService.getAllCourses();
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Course List',
          style: TextStyle(
            fontSize: 22,
            color: AppColors.accent,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(4),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              'assets/images/download.webp',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Flexible(
              child: ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  return GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => BlocProvider(
                            create: (_) => CourseDetailCubit(),
                            child: CourseDetailScreen(course: course),
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        right: 8.0,
                        top: 6.0,
                      ),
                      child: Card(
                        color: AppColors.card,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                ImageWidget(imageUrl: course.thumbnailUrl),
                                Positioned(
                                  right: 10,
                                  bottom: 5,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.card,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      formatDuration(course.durationSeconds),
                                      style: const TextStyle(
                                        color: AppColors.accent,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                              child: Text(
                                course.title,
                                style: const TextStyle(
                                  fontSize: 19,
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            CourseProgressWidget(course: course),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
