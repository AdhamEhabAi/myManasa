import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/Quiz/data/model/exam_history_model.dart';
import 'package:my_manasa/features/Quiz/data/model/exam_qusetion_model.dart';
import 'package:my_manasa/features/myCourses/data/models/quiz_homework_model.dart';

class QuizRepo extends Repository {
  final ApiService apiService;

  QuizRepo(this.apiService);

  Future<Either<Failure, List<QuizHomeworkModel>>> getQuizzes(
      {required String courseId}) async {
    try {
      final response = await apiService.get(
        url: '${APIEndpoints.baseUrl}/api-get-quiz.php?id=$courseId&type=1',
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'true') {
          List<QuizHomeworkModel> quizzes =
              (responseBody['data'] as List).map((quizJson) {
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

  Future<Either<Failure, List<ExamQuestion>>> getExamQuestions(
      {required String quizId}) async {
    try {
      final response = await apiService.get(
        url: '${APIEndpoints.baseUrl}/api-get-questions.php?id=$quizId',
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'true') {
          List<ExamQuestion> questions =
              (responseBody['data'] as List).map((questionJson) {
            return ExamQuestion.fromJson(questionJson as Map<String, dynamic>);
          }).toList();

          return Right(questions);
        } else {
          return Left(ServerFailure('لا يوجد أسئلة حالياً'));
        }
      } else {
        return Left(ServerFailure('فشل في جلب الأسئلة'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('خطأ في تنسيق البيانات: ${e.toString()}'));
    } on Exception catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }
  Future<Either<Failure, List<ExamHistory>>> getExamsHistory({required String userId}) async {
    try {
      final response = await apiService.get(
        url: 'https://skyonline-plus.com/api/api-get-score.php?id=$userId',
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody['status'] == 'true') {
          List<ExamHistory> examsHistory = (responseBody['data'] as List).map((examJson) {
            return ExamHistory.fromJson(examJson as Map<String, dynamic>);
          }).toList();
          return Right(examsHistory);
        } else {
          return Left(ServerFailure(responseBody['error'] ?? 'Failed to fetch exam history.'));
        }
      } else {
        return Left(ServerFailure('Failed to fetch exam history. Status Code: ${response.statusCode}'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('Data format error: ${e.toString()}'));
    } on Exception catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
