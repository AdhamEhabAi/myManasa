import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';

class QuizRepo extends Repository {
  final ApiService apiService;

  QuizRepo(this.apiService);

  Future<Either<Failure, List<QuizHomeworkModel>>> getQuizzes({required String courseId}) async {
    try {
      final response = await apiService.get(
        url: '${APIEndpoints.baseUrl}/api-get-quiz.php?id=$courseId&type=1',
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'true') {
          List<QuizHomeworkModel> quizzes = (responseBody['data'] as List).map((quizJson) {
            return QuizHomeworkModel.fromJson(quizJson as Map<String, dynamic>);
          }).toList();

          return Right(quizzes);
        } else {
          return Left(ServerFailure('لا يوجد اي امتحانات حالياً'));
        }
      } else {
        return Left(ServerFailure('فشل في جلب الامتحانات'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('خطأ في تنسيق البيانات: ${e.toString()}'));
    } on Exception catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }
}
