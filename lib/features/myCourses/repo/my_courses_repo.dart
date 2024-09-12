import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class MyCoursesRepo extends Repository {
  final ApiService apiService;

  MyCoursesRepo(this.apiService);

  Future<Either<Failure, List<CourseModel>>> getOwnedCourses({required String userId}) async {
    try {
      final response = await apiService.get(
        url: APIEndpoints.getAllCoursesOwned + userId,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Handle success response (List of courses)
        if (responseBody is Map<String, dynamic> && responseBody['status'] == 'true') {
          final List<dynamic> coursesJson = responseBody['data'];
          List<CourseModel> courses = coursesJson.map((courseJson) {
            return CourseModel.fromJson(courseJson as Map<String, dynamic>);
          }).toList();

          return Right(courses);
        }

        if (responseBody is Map<String, dynamic> && responseBody['status'] == 'false') {
          return Left(ServerFailure(responseBody['error'] ?? 'لا يوجد اي كورس تم شحنه'));
        }

        return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
      } else {
        return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    } on Exception catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    }
  }
}
