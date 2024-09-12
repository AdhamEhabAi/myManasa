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
    String? newPassword, // Made nullable
    String? confirmPassword, // Made nullable
  }) async {
    try {
      // Construct the URL with query parameters
      String url =
          '${APIEndpoints.baseUrl}/api-profile-setting.php?updateProfile=true&userid=$userId&password=$currentPassword&yr=${Uri.encodeComponent(year)}&lname=${Uri.encodeComponent(lastName)}&fname=${Uri.encodeComponent(firstName)}';

      // Append new password and confirm password even if they are null
      url += '&newpassword=${Uri.encodeComponent(newPassword ?? '')}';
      url += '&repassword=${Uri.encodeComponent(confirmPassword ?? '')}';

      // Debugging: Print the final constructed URL
      print("Constructed URL: $url");

      final response = await apiService.get(url: url);

      // Debugging: Print the raw response body
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        // Handling case when response is a List
        if (responseBody is List && responseBody.isNotEmpty) {
          final message = responseBody[0];
          print("Server Message: $message");
          if (message == "تم تحديث البيانات.") {
            return Right(message); // Success case
          } else {
            return Left(ServerFailure(message)); // Return failure with message
          }
        } else if (responseBody is String) {
          // Handle response when it comes directly as a string
          print("Server Response as String: $responseBody");
          if (responseBody == "تم تحديث البيانات.") {
            return Right(responseBody);
          } else {
            return Left(ServerFailure(responseBody));
          }
        } else if (responseBody is Map<String, dynamic> &&
            responseBody['password'] == 'true') {
          return Right('تم تحديث الملف الشخصي بنجاح');
        } else {
          print("Unhandled Response Type: $responseBody");
          return Left(ServerFailure(responseBody['message'] ?? 'خطأ غير معروف'));
        }
      } else {
        // Debugging: Print the response code if not 200
        print("Failed with status code: ${response.statusCode}");
        print("Response Body on Failure: ${response.body}");
        return Left(ServerFailure(
            'فشل في تحديث الملف الشخصي. كود الحالة: ${response.statusCode}'));
      }
    } catch (e) {
      // Debugging: Print any exceptions that occur during the API call
      print("Exception occurred: ${e.toString()}");
      return Left(ServerFailure('حدث خطأ غير متوقع: ${e.toString()}'));
    }
  }
}
