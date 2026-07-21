import 'package:chewie/chewie.dart';
import 'package:course_player_app/core/models/course_model.dart';
import 'package:course_player_app/course_detail/presentation/cubit/course_detail_cubit.dart';
import 'package:course_player_app/course_detail/presentation/cubit/course_detail_state.dart';
import 'package:course_player_app/course_detail/presentation/widgets/error_state_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseDetailScreen extends StatefulWidget {
  final CourseModel course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late final CourseDetailCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = context.read<CourseDetailCubit>();
    cubit.initializePlayer(widget.course.videoUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.course.title,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
            //fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<CourseDetailCubit, CourseDetailState>(
        builder: (context, state) {
          if (state is CourseDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Loading video',
                strokeWidth: 2.0,
                color: Colors.white,
              ),
            );
          } else if (state is CourseDetailReady) {
            return Column(
              children: [
                AspectRatio(
                  // aspectRatio: _videoController.value.aspectRatio,
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: cubit.chewieController!),
                ),

                const SizedBox(height: 20),

                //Padding(
                // padding: const EdgeInsets.all(16),
                //    child:
                Text(
                  widget.course.description,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                //),
              ],
            );
          }
          if (state is CourseDetailNoInternet) {
            return ErrorStateWidget(
              icon: Icons.wifi_off_rounded,
              title: 'No Internet Connection',
              subtitle: 'Please check your internet connection and try again.',
              onRetry: () {
                cubit.retry(widget.course.videoUrl);
              },
            );
          }
          if (state is CourseDetailVideoError) {
            return ErrorStateWidget(
              icon: Icons.error_outline_rounded,
              title: 'Unable to Load Video',
              subtitle:
                  'Something went wrong while loading this video. Please try again.',
              onRetry: () {
                cubit.retry(widget.course.videoUrl);
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
