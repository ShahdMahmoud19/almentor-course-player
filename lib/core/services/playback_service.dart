import 'package:shared_preferences/shared_preferences.dart';

class PlaybackService {
  static String _key(String courseId) => 'playback_$courseId';

  Future<void> savePosition({
    required String courseId,
    required int seconds,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_key(courseId), seconds);
  }

  Future<int> getSavedPosition(String courseId) async {
    final prefs = await SharedPreferences.getInstance();

    return prefs.getInt(_key(courseId)) ?? 0;
  }

  Future<void> clearPosition(String courseId) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_key(courseId));
  }
}