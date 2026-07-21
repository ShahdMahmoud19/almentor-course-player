import 'package:chewie/chewie.dart';
import 'package:course_player_app/core/services/playback_service.dart';
import 'package:course_player_app/course_detail/presentation/cubit/course_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:video_player/video_player.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit() : super(CourseDetailInitial());
  late VideoPlayerController videoController;
  ChewieController? chewieController;
  final PlaybackService playbackService = PlaybackService();
  int lastSavedSecond = 0;
  VoidCallback? playbackListener;

  Future<void> initializePlayer(
    String videoUrl, {
    required String courseId,
  }) async {
    emit(CourseDetailLoading());
    final hasInternet = await InternetConnection().hasInternetAccess;

    if (!hasInternet) {
      emit(CourseDetailNoInternet());
      return;
    }
    try {
      videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      await videoController.initialize();
      //editt
      final savedPosition = await playbackService.getSavedPosition(courseId);
      if (savedPosition > 0) {
        await videoController.seekTo(Duration(seconds: savedPosition));
      }
      chewieController = ChewieController(
        videoPlayerController: videoController,
        //  maxScale: 12.0,
        autoPlay: false,
        looping: false,

        allowFullScreen: true,
        allowMuting: true,
        allowPlaybackSpeedChanging: true,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.red,
          bufferedColor: Colors.white54,
          backgroundColor: Colors.grey.shade700,
        ),
      );
      startPlaybackListener(courseId);
      emit(CourseDetailReady());
    } catch (e) {
      emit(CourseDetailVideoError('Failed to load video: ${e.toString()}'));
    }
  }

  Future<void> retry(String videoUrl, {required String courseId}) async {
    await initializePlayer(videoUrl, courseId: courseId);
  }
  void startPlaybackListener(String courseId) {
    playbackListener = () async {
      if (!videoController.value.isInitialized) return;

      if (!videoController.value.isPlaying) return;

      final currentSecond = videoController.value.position.inSeconds;

      if (currentSecond != lastSavedSecond) {
        lastSavedSecond = currentSecond;

        await playbackService.savePosition(
          courseId: courseId,
          seconds: currentSecond,
        );
      }

      if (videoController.value.position >= videoController.value.duration) {
        await playbackService.clearPosition(courseId);
      }
    };

    videoController.addListener(playbackListener!);
  }

  @override
  Future<void> close() {
    videoController.dispose();
    chewieController?.dispose();
    if (playbackListener != null) {
      videoController.removeListener(playbackListener!);
    }
    return super.close();
  }

}
