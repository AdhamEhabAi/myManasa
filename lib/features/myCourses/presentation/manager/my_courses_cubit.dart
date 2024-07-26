import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'my_courses_state.dart';

class MyCoursesCubit extends Cubit<MyCoursesState> {
  MyCoursesCubit() : super(MyCoursesInitial());
  bool isVideo = false;


  void switchComplete() {
    isVideo = !isVideo;
    emit(CourseVideoPdfSwitched());
  }

  void onPageChanged(int index) {
    isVideo = index != 1;
    emit(CourseVideoPdfChanged(isVideo));
  }
}
