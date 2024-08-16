import 'package:flutter/material.dart';

abstract class AppColors{
  static const Color primaryColor = Color(0xFF17346D);
  static const Color secondaryColor = Color(0xFF6B7DA2);

}

abstract class AppPadding{
  static const double padding = 20;
}


const domain = 'https://api.west-online-academy.com';
const imgPath = '$domain/upload/';
const signInApi = '$domain/api-login.php';
const signUpApi = '$domain/api-sing-up.php';
const getAllLessonsApi =
    '$domain/api-selectData.php?tableName=videos&where=sub&equalWhat=';
const getAllTeachersApi =
    '$domain/api-selectData.php?tableName=users&where=rank&equalWhat=2';
const getTeacherByCourseApi =
    '$domain/api-selectData.php?tableName=users&where=id&equalWhat=';
const getCourseByCode = '$domain/api/api-code.php';
const getOwnedCourses =
    '$domain/api-getOwnedCourse.php';
const getAllYearsApi =
    '$domain/api-selectData.php?tableName=class&where=NULL&equalWhat=NULL';
const getAllCoursesByYear =
    '$domain/api-selectData.php?tableName=cat&where=class&equalWhat=';
const checkIfTheCourseIsOwned =
    '$domain/api-getOwnedCourse.php';
const getCoursesByTeacher =
    '$domain/api-selectData.php?tableName=videos&where=pub&equalWhat=';
const getAllLessonsByYearApi =
    '$domain/api-selectData.php?tableName=videos&where=yr&equalWhat=';
