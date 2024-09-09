import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/myCourses/repo/my_courses_repo.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  final MyCoursesRepo myCoursesRepo;

  MyCoursesCubit(this.myCoursesRepo) : super(MyCoursesInitial());

  bool isVideo = true;

  void switchComplete() {
    isVideo = !isVideo;
    emit(CourseVideoPdfSwitched());
  }

  void onPageChanged(int index) {
    isVideo = index != 1;
    emit(CourseVideoPdfChanged(isVideo));
  }

  Future<void> fetchOwnedCourses({required String userId}) async {
    emit(MyCoursesLoading());
    final result = await myCoursesRepo.getOwnedCourses(userId: userId);
    result.fold(
          (failure) => emit(MyCoursesError(failure.message)),
          (courses) => emit(MyCoursesLoaded(courses)),
    );
  }
}
