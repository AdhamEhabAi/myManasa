import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit() : super(HomeInitial());
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
