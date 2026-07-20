import 'package:chewie/chewie.dart';
import 'package:course_player_app/core/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CourseDetailScreen extends StatefulWidget {
  final CourseModel course;

  const CourseDetailScreen({super.key, required this.course});

  @override
  State<CourseDetailScreen> createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late VideoPlayerController _videoController;
  ChewieController? _chewieController;
  @override
  void initState() {
    super.initState();

    _initializePlayer();
  }

  Future<void> _initializePlayer() async {
    _videoController = VideoPlayerController.networkUrl(
      Uri.parse(widget.course.videoUrl),
    );

    await _videoController.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoController,
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

    setState(() {});
  }

  @override
  void dispose() {
    _videoController.dispose();
    _chewieController?.dispose();
    super.dispose();
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
      body: _chewieController == null
          ? const Center(
              child: CircularProgressIndicator(
                semanticsLabel: 'Loading video',
                strokeWidth: 2.0,
                color: Colors.white,
              ),
            )
          : Column(
              children: [
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Chewie(controller: _chewieController!),
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
            ),
    );
  }
}
