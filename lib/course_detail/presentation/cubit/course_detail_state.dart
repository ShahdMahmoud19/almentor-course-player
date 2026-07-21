abstract class CourseDetailState {}

class CourseDetailInitial extends CourseDetailState {}

class CourseDetailLoading extends CourseDetailState {}

class CourseDetailReady extends CourseDetailState {}

class CourseDetailNoInternet extends CourseDetailState {}

class CourseDetailVideoError extends CourseDetailState {
  final String message;

  CourseDetailVideoError(this.message);
}
