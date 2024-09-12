
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/errors/failures.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:my_manasa/features/myCourses/data/models/pdf_model.dart';

class PdfRepo extends Repository {
  final ApiService apiService;

  PdfRepo(this.apiService);

  Future<Either<Failure, List<PdfModel>>> getPdfs({required String courseId}) async {
    try {
      final response = await apiService.get(
        url: APIEndpoints.getPDFSbyCourseID + courseId,
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Handle success response (List)
        if (responseBody is List) {
          List<PdfModel> pdfs = responseBody.map((pdfJson) {
            // Assuming each entry is a Map and we are only using the needed keys
            return PdfModel.fromJson(pdfJson as Map<String, dynamic>);
          }).toList();

          return Right(pdfs);
        }

        // Handle failure response (Map with 'status': 'null')
        if (responseBody is Map<String, dynamic> && responseBody['status'] == 'null') {
          return Left(ServerFailure('لا توجد ملفات PDF متاحة.'));
        }

        // Handle unexpected response format
        return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
      } else {
        return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
      }
    } on FormatException catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    } on Exception catch (e) {
      return Left(ServerFailure('هناك خطأ في الاتصال بالشبكة'));
    }
  }
}
