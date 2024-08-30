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
      final response = await apiService.get(url: APIEndpoints.getAllTeachersApi); // Replace with the actual API endpoint

      final List<dynamic> responseData = jsonDecode(response.body);


      List<Teacher> teachers = responseData.map((teacherJson) {
        return Teacher.fromJson(teacherJson as Map<String, dynamic>);
      }).toList();

      return Right(teachers);
    } catch (e) {
      return Left('An error occurred: ${e.toString()}');
    }
  }

  Future<Either<String,List<CourseModel>>> getCoursesByTeacherID({required String teacherID})async
  {
    try {
      final response = await apiService.get(url: APIEndpoints.getCoursesByTeacherID+teacherID);
      final List<dynamic> responseData = jsonDecode(response.body);

      List<CourseModel> courses = responseData.map((e) {
        return CourseModel.fromJson(e as Map<String,dynamic>);
      },).toList();
      return Right(courses);
    } on Exception catch (e) {
      return Left('An error occurred: ${e.toString()}');
    }
  }
}
