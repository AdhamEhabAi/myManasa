import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';
import 'package:my_manasa/features/homeTeachers/presentation/repo/teacher_repo.dart';

part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  final TeacherRepo teacherRepo;
  List<Teacher> teachersList = [];
  List<CourseModel> coursesList = [];
  bool isCourseOwned = false; // New field to store ownership status

  TeacherCubit(this.teacherRepo) : super(TeacherInitial());

  Future<void> fetchAllTeachers() async {
    emit(TeacherLoading());
    final result = await teacherRepo.getAllTeachers();
    result.fold(
          (failure) => emit(TeacherError(failure)),
          (teachers) {
        teachersList = teachers;
        emit(TeacherLoaded());
      },
    );
  }

  Future<void> getCoursesByTeacherID({required String teacherID}) async {
    emit(CoursesLoading());

    final result = await teacherRepo.getCoursesByTeacherID(teacherID: teacherID);
    result.fold(
          (failure) => emit(CoursesError(failure)),
          (courses) {
        coursesList = courses;
        emit(CoursesLoaded());
      },
    );
  }

  // Method to check course ownership
  Future<void> checkCourseOwnership({required String courseID, required String userID}) async {
    emit(CheckOwnershipLoading());
    final result = await teacherRepo.checkCourseOwnership(courseID: courseID, userID: userID);
    result.fold(
          (failure) => emit(CheckOwnershipError(failure)),
          (isOwned) {
        isCourseOwned = isOwned;
        emit(CheckOwnershipLoaded(isOwned));
      },
    );
  }

  // Method to reset course ownership status
  void resetCourseOwnership() {
    isCourseOwned = false;
    emit(CheckOwnershipLoaded(false)); // Emit state to notify listeners
  }
}
