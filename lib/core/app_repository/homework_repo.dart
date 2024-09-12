import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';

class HomeWorkRepo extends Repository {
  final ApiService apiService;

  HomeWorkRepo(this.apiService);

  Future<Either<Failure, List<QuizHomeworkModel>>> getHomeWorks({required String courseId}) async {
    try {
      final response = await apiService.get(
        url: '${APIEndpoints.baseUrl}/api-get-quiz.php?id=$courseId&type=2',
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'true') {
          List<QuizHomeworkModel> homeWorks = (responseBody['data'] as List).map((homeWorkJson) {
            return QuizHomeworkModel.fromJson(homeWorkJson as Map<String, dynamic>);
          }).toList();

          return Right(homeWorks);
        } else {
          return Left(ServerFailure('لا يوجد أي واجبات حالياً'));
        }
      } else {
        return Left(ServerFailure('فشل في جلب الواجبات'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    } on Exception catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    }
  }
}
