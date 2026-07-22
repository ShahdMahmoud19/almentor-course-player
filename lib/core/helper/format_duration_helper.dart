String formatDuration(int seconds) {
  final duration = Duration(seconds: seconds);

  final minutes = duration.inMinutes;
  final remainingSeconds = duration.inSeconds % 60;

  return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
}