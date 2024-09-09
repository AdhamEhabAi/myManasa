import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/homeTeachers/data/models/course_model.dart';

class SearchRepo extends Repository {
  final ApiService apiService;

  SearchRepo(this.apiService);

  Future<Either<Failure, List<CourseModel>>> getCoursesBySearch({required String courseName}) async {
    try {
      final response = await apiService.get(
        url: APIEndpoints.search + courseName,
      );

      // Log the response body for debugging
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // If the response is a list, it means it's a successful search
        if (responseBody is List) {
          List<CourseModel> courses = responseBody.map((courseJson) {
            return CourseModel.fromJson(courseJson as Map<String, dynamic>);
          }).toList();

          return Right(courses);
        }

        if (responseBody is Map<String, dynamic> && responseBody['status'] == 'false') {
          return Left(ServerFailure('لا يوجد نتايج'));
        }

        return Left(ServerFailure('لا يوجد نتايج'));
      } else {
        // If the status code is not 200
        return Left(ServerFailure('لا يوجد نتايج'));
      }
    } on FormatException catch (e) {
      // Handle JSON format exceptions
      return Left(ServerFailure('لا يوجد نتايج'));
    } on Exception catch (e) {
      // Handle any other exceptions
      return Left(ServerFailure('لا يوجد نتايج'));
    }
  }
}
