import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/features/homeSubjects/repo/subject_repo.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.subjectRepo) : super(HomeInitial());

  bool isVideo = false;
  final SubjectRepo subjectRepo;
  List<SubjectModel> subjectsList = [];

  Future<void> fetchSubjects() async {
    emit(SubjectsLoading());
    final result = await subjectRepo.getSubjects();
    result.fold(
          (failure) {
        emit(SubjectsFail(failure.message));
      },
          (subjects) {
        subjectsList = subjects;
        emit(SubjectsSuccess());
      },
    );
  }

  void switchComplete() {
    isVideo = !isVideo;
    emit(CourseVideoPdfSwitched());
  }

  void onPageChanged(int index) {
    isVideo = index != 1;
    emit(CourseVideoPdfChanged(isVideo));
  }

  void resetState() {
    isVideo = false;
    emit(HomeInitial());
  }
}
