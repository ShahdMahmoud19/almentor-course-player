import 'package:chewie/chewie.dart';
import 'package:course_player_app/course_detail/presentation/cubit/course_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:video_player/video_player.dart';

class CourseDetailCubit extends Cubit<CourseDetailState> {
  CourseDetailCubit() : super(CourseDetailInitial());
  late VideoPlayerController videoController;
  ChewieController? chewieController;
  Future<void> initializePlayer(String videoUrl) async {

    emit(CourseDetailLoading());
    final hasInternet =
    await InternetConnection().hasInternetAccess;

if (!hasInternet) {
  emit(CourseDetailNoInternet());
  return;
}
    try {
      videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));

      await videoController.initialize();

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
      emit(CourseDetailReady());
    }
     catch (e) {
      emit(CourseDetailVideoError('Failed to load video: ${e.toString()}'));
    }

  }
      Future<void> retry(String videoUrl) async {
      await initializePlayer(videoUrl);
    }

    @override
    Future<void> close() {
      videoController.dispose();
      chewieController?.dispose();
      return super.close();
    }

}
