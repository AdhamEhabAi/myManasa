
class APIEndpoints {

  static const baseUrl = 'https://api.west-online-academy.com';
  static const imgPath = '$baseUrl/upload/';
  static const signInApi = '$baseUrl/api-login.php';
  static const signUpApi = '$baseUrl/api-sing-up.php';
  static const getAllLessonsApi =
      '$baseUrl/api-selectData.php?tableName=videos&where=sub&equalWhat=';
  static const getAllTeachersApi =
      '$baseUrl/api-selectData.php?tableName=users&where=rank&equalWhat=2';
  static const getTeacherByCourseApi =
      '$baseUrl/api-selectData.php?tableName=users&where=id&equalWhat=';
  static const getCourseByCode = '$baseUrl/api/api-code.php';
  static const getOwnedCourses =
      '$baseUrl/api-getOwnedCourse.php';
  static const getAllYearsApi =
      '$baseUrl/api-selectData.php?tableName=class&where=NULL&equalWhat=NULL';
  static const getAllCoursesByYear =
      '$baseUrl/api-selectData.php?tableName=cat&where=class&equalWhat=';
  static const checkIfTheCourseIsOwned =
      '$baseUrl/api-getOwnedCourse.php';
  static const getCoursesByTeacher =
      '$baseUrl/api-selectData.php?tableName=videos&where=pub&equalWhat=';
  static const getAllLessonsByYearApi =
      '$baseUrl/api-selectData.php?tableName=videos&where=yr&equalWhat=';
}
