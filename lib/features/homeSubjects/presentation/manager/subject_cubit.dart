import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/features/homeSubjects/repo/subject_repo.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';

part 'subject_state.dart';



class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.subjectRepo) : super(HomeInitial());

  bool isVideo = false;
  final SubjectRepo subjectRepo;
  List<SubjectModel> subjectsList = [];
  List<Teacher> teachersList = [];

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

  Future<void> fetchAllTeachersForSubject({required String subjectName}) async {
    if (teachersList.isEmpty) { // Ensure this check is made before fetching
      emit(AllTeachersLoading());
      final result = await subjectRepo.getAllTeachersForSubject(subjectName: subjectName);
      result.fold(
            (failure) {
          emit(AllTeachersFail(failure.message));
        },
            (teachers) {
          teachersList = teachers;
          emit(AllTeachersLoaded());
        },
      );
    } else {
      emit(AllTeachersLoaded());
    }
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
    // Do not clear teachersList to retain the fetched data
    emit(HomeInitial());
  }
}