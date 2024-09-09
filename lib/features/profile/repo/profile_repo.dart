import 'dart:convert';
import 'package:my_manasa/core/app_repository/repo.dart';
import 'package:my_manasa/core/network/api_endpoints.dart';
import 'package:my_manasa/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:my_manasa/core/errors/failures.dart';

class ProfileRepo extends Repository {
  final ApiService apiService;

  ProfileRepo(this.apiService);

  Future<Either<Failure, String>> updateProfile({
    required String userId,
    required String currentPassword,
    required String year,
    required String lastName,
    required String firstName,
    required String newPassword,
    required String confirmPassword,
  }) async {
    try {
      // Construct the URL with query parameters
      final url =
          '${APIEndpoints.baseUrl}/api-profile-setting.php?updateProfile=true&userid=$userId&password=$currentPassword&yr=${year ?? ''}&lname=${lastName ?? ''}&fname=${firstName ?? ''}&newpassword=${newPassword ?? ''}&repassword=${confirmPassword ?? ''}';

      final response = await apiService.get(url: url);

      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Handling case when response is a List
        if (responseBody is List && responseBody.isNotEmpty) {
          final message = responseBody[0];
          if (message == "تم تحديث البيانات.") {
            return Right(message); // Success case
          } else {
            return Left(ServerFailure(message)); // Return failure with message
          }
        } else if (responseBody is String) {
          // Handle response when it comes directly as a string
          if (responseBody == "تم تحديث البيانات.") {
            return Right(responseBody);
          } else {
            return Left(ServerFailure(responseBody));
          }
        } else if (responseBody is Map<String, dynamic> &&
            responseBody['password'] == 'true') {
          return Right('تم تحديث الملف الشخصي بنجاح');
        }

        return Left(
            ServerFailure(responseBody['message'] ?? 'كلمة المرور غير صحيحة'));
      } else {
        return Left(ServerFailure(
            'فشل في تحديث الملف الشخصي. كود الحالة: ${response.statusCode}'));
      }
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }
}
