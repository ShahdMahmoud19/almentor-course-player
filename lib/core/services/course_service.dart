import 'package:course_player_app/core/models/course_model.dart';

class CourseService {
  static List<CourseModel> getAllCourses() {
    return [
      CourseModel(
        id: 'c001',
        title: 'Intro to UI/UX Design',
        thumbnailUrl:
            'https://teknovation.io/wp-content/uploads/2023/03/UI-UX-design-Blog.jpg',
        durationSeconds: 30,
        description: 'A short primer on UI/UX fundamentals.',
        videoUrl: 'https://cdn.pixabay.com/video/2026/07/10/363199_large.mp4',
      ),
      CourseModel(
        id: 'c002',
        title: 'Digital Marketing Basics',
        thumbnailUrl:
            'https://pixel-systems.com/assets/images/about/digital-marketing.webp',
        durationSeconds: 30,
        description: 'Core concepts every marketer should know.',
        videoUrl: 'https://cdn.pixabay.com/video/2026/03/31/343478_large.mp4',
      ),
      CourseModel(
        id: 'c003',
        title: 'Public Speaking Confidence',
        thumbnailUrl:
            'https://th.bing.com/th/id/R.f1978816c861b98ea0cb7152a3afbee3?rik=XR1TotSk9siGHw&pid=ImgRaw&r=0',
        durationSeconds: 30,
        description: 'Practical tips to speak with confidence.',
        videoUrl: 'https://cdn.pixabay.com/video/2026/07/01/361729_large.mp4',
      ),
      CourseModel(
        id: 'c004',
        title: 'Excel for Beginners',
        thumbnailUrl:'https://media.geeksforgeeks.org/wp-content/uploads/20240701164511/Microsoft-Excel-Courses.webp',
        durationSeconds: 30,
        description: 'Spreadsheets from zero to comfortable.',
        videoUrl: 'https://cdn.pixabay.com/video/2026/06/16/358693_large.mp4',
      ),
    ];
  }
}
