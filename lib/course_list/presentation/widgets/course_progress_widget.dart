import 'package:course_player_app/core/models/course_model.dart';
import 'package:course_player_app/core/services/playback_service.dart';
import 'package:course_player_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CourseProgressWidget extends StatelessWidget {
  final CourseModel course;
  CourseProgressWidget({super.key, required this.course});
  final PlaybackService playbackService = PlaybackService();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
      future: playbackService.getSavedPosition(course.id),
      builder: (context, snapshot) {
        final watchedSeconds = snapshot.data ?? 0;
        final progress = (watchedSeconds / course.durationSeconds).clamp(
          0.0,
          1.0,
        );
        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: LinearProgressIndicator(
                  minHeight: 5,
                  value: progress,
                  borderRadius: BorderRadius.circular(10),
                  backgroundColor: AppColors.grey300,
                  valueColor: const AlwaysStoppedAnimation<Color>(
                    AppColors.secondary,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(right: 5.0, bottom: 4.0),
              child: Text(
                '${(progress * 100).toInt()}%',
                style: const TextStyle(fontSize: 17, color: AppColors.accent),
              ),
            ),
          ],
        );
      },
    );
  }
}
