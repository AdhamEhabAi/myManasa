import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/myCourses/data/models/video_model.dart';
import '../../../core/network/api_endpoints.dart';

class SubjectVideoRepo extends Repository {
  final ApiService apiService;

  SubjectVideoRepo(this.apiService);

  Future<Either<Failure, List<VideoModel>>> getVideos({required String courseId}) async {
    try {
      final response = await apiService.get(
        url: APIEndpoints.getAllVideosForOwnedCourse + courseId,
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);

        List<VideoModel> videos = responseData.map((videoJson) {
          return VideoModel.fromJson(videoJson as Map<String, dynamic>);
        }).toList();

        return Right(videos);
      } else {
        return Left(ServerFailure(
            'هناك خطأ في الاتصال بالشبكة'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    } on Exception catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    }
  }
}
