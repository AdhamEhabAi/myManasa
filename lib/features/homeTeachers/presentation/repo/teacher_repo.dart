import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';

class TeacherRepo extends Repository {
  final ApiService apiService;

  TeacherRepo(this.apiService);

  Future<Either<String, List<Teacher>>> getAllTeachers() async {
    try {
      final response = await apiService.get(url: APIEndpoints.getAllTeachersApi);
      final List<dynamic> responseData = jsonDecode(response.body);

      List<Teacher> teachers = responseData.map((teacherJson) {
        return Teacher.fromJson(teacherJson as Map<String, dynamic>);
      }).toList();

      return Right(teachers);
    } catch (e) {
      return Left('هناك خطأ في الاتصال بالشبكة');
    }
  }

  Future<Either<String, List<CourseModel>>> getCoursesByTeacherID({required String teacherID}) async {
    try {
      final response = await apiService.get(url: APIEndpoints.getCoursesByTeacherID + teacherID);
      final List<dynamic> responseData = jsonDecode(response.body);

      List<CourseModel> courses = responseData.map((e) {
        return CourseModel.fromJson(e as Map<String, dynamic>);
      }).toList();
      return Right(courses);
    } on Exception catch (e) {
      return Left('هناك خطأ في الاتصال بالشبكة');
    }
  }

  // New method to check if the student owns the course
  Future<Either<String, bool>> checkCourseOwnership({required String courseID, required String userID}) async {
    try {
      final String url = '${APIEndpoints.baseUrl}/api-checkowned.php?idcourse=$courseID&iduser=$userID';
      final response = await apiService.get(url: url);
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      if (responseData['status'] == 'true') {
        return Right(true);  // Student owns the course
      } else if (responseData['status'] == 'false') {
        return Right(false);  // Student does not own the course
      } else {
        return Left('هناك خطأ في الاتصال بالشبكة');
      }
    } on Exception catch (e) {
      return Left('هناك خطأ في الاتصال بالشبكة');
    }
  }
}
