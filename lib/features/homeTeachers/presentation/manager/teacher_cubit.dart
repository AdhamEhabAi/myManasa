import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/repo/teacher_repo.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  final TeacherRepo teacherRepo;

  TeacherCubit(this.teacherRepo) : super(TeacherInitial());

  Future<void> fetchAllTeachers() async {
    emit(TeacherLoading());
    final result = await teacherRepo.getAllTeachers();
    result.fold(
          (failure) => emit(TeacherError(failure)),
          (teachers) => emit(TeacherLoaded(teachers)),
    );
  }
}
