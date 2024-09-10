import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/myCourses/data/models/video_model.dart';
import '../../../core/network/api_endpoints.dart';

class VideoRepo extends Repository {
  final ApiService apiService;

  VideoRepo(this.apiService);

  Future<Either<Failure, List<VideoModel>>> getVideos({required String courseId}) async {
    try {
      final response = await apiService.get(
        url: APIEndpoints.getAllVideosForOwnedCourse + courseId,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        if (responseBody is List) {
          List<VideoModel> videos = responseBody.map((videoJson) {
            return VideoModel.fromJson(videoJson as Map<String, dynamic>);
          }).toList();

          return Right(videos);
        } else if (responseBody is Map<String, dynamic> && responseBody.containsKey('videos')) {
          List<VideoModel> videos = (responseBody['videos'] as List).map((videoJson) {
            return VideoModel.fromJson(videoJson as Map<String, dynamic>);
          }).toList();
          return Right(videos);
        } else {
          return Left(ServerFailure('لا يوجد فيديوهات'));
        }
      } else {
        return Left(ServerFailure('لا يوجد فيديوهات'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('لا يوجد فيديوهات'));
    } on Exception catch (e) {
      return Left(ServerFailure('لا يوجد فيديوهات'));
    }
  }
}
