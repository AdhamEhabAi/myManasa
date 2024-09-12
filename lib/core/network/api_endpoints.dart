class APIEndpoints {
  static const baseUrl = 'https://skyonline-plus.com/api';
  static const imgPath = 'https://skyonline-plus.com/';
  static const pdfPath = 'https://skyonline-plus.com/pdf/';
  static const imgPathForSubjects = 'https://skyonline-plus.com/assets/img/brand/';


  static const signInApi = '$baseUrl/api-login.php';
  static const signUpApi = '$baseUrl/api-sing-up.php';
  static const getAllSubjects =
      '$baseUrl/api-selectData.php?tableName=cat&where=NULL&equalWhat=00';
  static const getCoursesByTeacherID =
      '$baseUrl/api-selectData.php?tableName=videos&where=pub&equalWhat=';
  static const getAllVideosForOwnedCourse =
      '$baseUrl/api-selectData.php?tableName=videolink&where=idclassroom&equalWhat=';
  static const getAllTeachersForSubject =
      '$baseUrl/api-TeatcherProfile.php?where=sec&equalWhat=';
  static const getPDFSbyCourseID =
      '$baseUrl/api-selectData.php?tableName=filepdf&where=idclassroom&equalWhat=';
  static const getAllTeachersApi =
      '$baseUrl/api-selectData.php?tableName=users&where=rank&equalWhat=2';

  static const getCourseByCode =
      '$baseUrl/api-code.php';

  static const getAllCoursesOwned =
      '$baseUrl/api-getOwnedCourse.php?id=';
  static const search =
      '$baseUrl/api-search.php?search=';
}
