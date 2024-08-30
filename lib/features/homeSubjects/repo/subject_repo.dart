import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/exceptions.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/homeSubjects/data/models/SubjectModel.dart';

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
}
