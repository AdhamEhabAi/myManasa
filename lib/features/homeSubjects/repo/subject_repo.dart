import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';
import 'package:my_manasa/features/homeTeachers/data/models/teacher_model.dart';

class SubjectRepo extends Repository {
  final ApiService apiService;

  SubjectRepo(this.apiService);

  Future<Either<Failure, List<SubjectModel>>> getSubjects() async {
    try {
      final response = await apiService.get(url: APIEndpoints.getAllSubjects);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        List<SubjectModel> subjects = responseData.map((subjectJson) {
          return SubjectModel.fromJson(subjectJson as Map<String, dynamic>);
        }).toList();

        return Right(subjects);
      } else {
        return Left(ServerFailure('Failed to fetch subjects. Status Code: ${response.statusCode}'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('Data format error: ${e.toString()}'));
    } on Exception catch (e) {
      return Left(ServerFailure('An unexpected error occurred: ${e.toString()}'));
    }
  }


  Future<Either<Failure, List<Teacher>>> getAllTeachersForSubject({required String subjectName}) async {
    try {
      final response = await apiService.get(url: APIEndpoints.getAllTeachersForSubject + subjectName);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Handle success response (List)
        if (responseBody is List) {
          List<Teacher> teachers = responseBody.map((subjectJson) {
            return Teacher.fromJson(subjectJson as Map<String, dynamic>);
          }).toList();

          return Right(teachers);
        }

        // Handle failure response (Map with 'status': 'null')
        if (responseBody is Map<String, dynamic> && responseBody['status'] == 'null') {
          return Left(ServerFailure('لا يوجد مدرسون متاحون لهذا الموضوع.'));
        }

        // Handle unexpected response format
        return Left(ServerFailure('شكل استجابة غير متوقع من الخادم.'));
      } else {
        return Left(ServerFailure('فشل في جلب المدرسين. كود الحالة: ${response.statusCode}'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('خطأ في تنسيق البيانات: ${e.toString()}'));
    } on Exception catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }

}
