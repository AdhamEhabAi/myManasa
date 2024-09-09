import 'package:dio/dio.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';

class CodeRepo extends Repository {
  final Dio _dio = Dio();

  Future<Either<Failure, bool>> purchaseCourse({required String userId, required String code}) async {
    const String apiUrl = APIEndpoints.getCourseByCode; // Adjust with the correct endpoint

    try {
      final response = await _dio.get(apiUrl, queryParameters: {
        'code': code,
        'id': userId,
      });

      if (response.statusCode == 200) {
        final responseData = response.data;
        if (responseData['status'] == "true") {
          // Purchase was successful
          return const Right(true);
        } else {
          // Handle failure or wrong code
          return Left(ServerFailure('الكود خطأ. يرجى المحاولة مرة أخرى.'));
        }
      } else {
        return Left(ServerFailure('Failed to purchase course. Status Code: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(ServerFailure('An unexpected error occurred: $e'));
    }
  }
}
