import 'package:dio/dio.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';

class CodeRepo extends Repository {
  final Dio _dio = Dio();

  Future<Either<Failure, bool>> purchaseCourse({
    required String userId,
    required String code,
    String? idCourse, // Made nullable
  }) async {
    const String apiUrl = APIEndpoints.getCourseByCode;

    try {
      // Prepare query parameters
      final queryParameters = {
        'code': code,
        'id': userId,
        if (idCourse != null) 'idcourse': idCourse,
      };

      final response = await _dio.get(apiUrl, queryParameters: queryParameters);

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
        return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
      }
    } catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    }
  }
}
