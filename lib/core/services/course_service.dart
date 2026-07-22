import 'package:course_player_app/core/models/course_model.dart';

class CourseService {
  static List<CourseModel> getAllCourses() {
    return [
      CourseModel(
        id: 'c001',
        title: 'Intro to UI/UX Design',
        thumbnailUrl:
            'https://teknovation.io/wp-content/uploads/2023/03/UI-UX-design-Blog.jpg',
        durationSeconds: 11,
        description: [
          'Understand the difference between UI and UX design.',
          'Learn the fundamentals of user-centered design.',
          'Create simple wireframes and user flows.',
          'Apply visual design principles such as color, typography, and spacing.',
          'Design intuitive interfaces that improve user experience.',
        ],
        videoUrl:
            'https://media.istockphoto.com/id/1345397067/video/black-male-creating-cellphone-app-on-computer.mp4?s=mp4-640x640-is&k=20&c=r9TA2eLze5yT85SwYaB656c5hAZ-2MALfYe4NfDpvUc=',
      ),
      CourseModel(
        id: 'c002',
        title: 'Digital Marketing Basics',
        thumbnailUrl:
            'https://pixel-systems.com/assets/images/about/digital-marketing.webp',
        durationSeconds: 10,
        description: [
          'Understand the fundamentals of digital marketing.',
          'Learn the basics of SEO, social media, and email marketing.',
          'Create effective marketing campaigns for different audiences.',
          'Measure campaign performance using key marketing metrics.',
          'Develop a simple digital marketing strategy from scratch.',
        ],
        videoUrl:
            'https://media.istockphoto.com/id/1333453168/video/adult-woman-leading-a-strategic-business-plan-meeting-pointing-at-the-white-board-while.mp4?b=1&s=192_srp&k=20&c=nudoNZZhbK9DfuB-dTBR3wTU8eiRV3Em1VmqVQmpIdo=',
      ),
      CourseModel(
        id: 'c003',
        title: 'Public Speaking Confidence',
        thumbnailUrl:
            'https://th.bing.com/th/id/R.f1978816c861b98ea0cb7152a3afbee3?rik=XR1TotSk9siGHw&pid=ImgRaw&r=0',
        durationSeconds: 22,
        description: [
          'Overcome stage fear and speak with confidence.',
          'Improve voice projection, tone, and body language.',
          'Structure presentations for maximum audience engagement.',
          'Handle questions and unexpected situations effectively.',
          'Deliver persuasive and memorable speeches.',
        ],
        videoUrl:
            'https://media.istockphoto.com/id/628176956/video/businesswoman-making-presentation-at-conference-shot-on-r3d.mp4?b=1&s=192_srp&k=20&c=g-HqkAX4zt2NZKuaRsk2Cfb7YO9w-zEzPlhojl__Vg8=',
      ),
      CourseModel(
        id: 'c004',
        title: 'Excel for Beginners',
        thumbnailUrl:
            'https://media.geeksforgeeks.org/wp-content/uploads/20240701164511/Microsoft-Excel-Courses.webp',
        durationSeconds: 17,
        description: [
          'Navigate the Excel interface and understand workbook basics.',
          'Enter, format, and organize data efficiently.',
          'Use essential formulas and functions such as SUM, AVERAGE, and IF.',
          'Sort, filter, and analyze data with built-in tools.',
          'Create professional charts and tables to visualize data.',
        ],
        videoUrl:
            'https://media.istockphoto.com/id/2200575943/video/group-of-people-working-in-business-office-with-computers-on-desks-and-talking-on-phones.mp4?b=1&s=192_srp&k=20&c=oOQgIG-ffkPGtcST060YEFFBDlnXgt65OYk18hyq26Q=',
      ),
    ];
  }
}
