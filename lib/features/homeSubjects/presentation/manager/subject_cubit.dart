import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/features/homeSubjects/repo/subject_repo.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';

part 'subject_state.dart';

class SubjectCubit extends Cubit<SubjectState> {
  SubjectCubit(this.subjectRepo) : super(HomeInitial());

  bool isVideo = true;
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

  Future<void> fetchAllTeachersForSubject({required String subjectName}) async {
    emit(AllTeachersLoading());
    final result = await subjectRepo.getAllTeachersForSubject(subjectName: subjectName);
    result.fold(
          (failure) {
        emit(AllTeachersFail(failure.message));
      },
          (teachers) {
        emit(AllTeachersLoaded(teachers)); // Emit teachers directly in state
      },
    );
  }






}
