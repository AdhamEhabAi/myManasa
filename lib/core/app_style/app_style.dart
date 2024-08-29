import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyle {
  static Color primaryColor = Color(0xFF17346D);
  static  Color secondaryColor = Color(0xFF6B7DA2);
  static Color secondColor = const Color(0xFF33F3FE);

  static Color amberColor = Colors.amber.shade200;

  static Color watermelonColor = const Color(0xFFF25A72);

  static Color senderColor = const Color(0xFF376BF5);

  static Color greyColor2 = const Color(0xFF313131);

  static Color blueColor = const Color(0xff04DCEF);
  static Color pinkColor = const Color(0xFFFF92C2);
  static Color darkPrimaryColor = const Color(0xff004ec2);
  static const Color redErrorColor = Color(0xffde0a4a);
  static const Color redBan = Color(0xffFF2C20);
  static const Color offWhite = Color(0xFFE8E8E8);
  static const Color greyColor = Color(0xFF939292);
  static const Color greyScaffoldColor = Color(0xFF313131);
  static const Color starBG = Color(0xFFE7EAF0);

  static const Color black = Color(0xFF000000);
  static const Color white = Colors.white;
  static const Color green = Colors.green;
  static const Color red = Colors.red;
  static const Color underDevelopment = Color(0xFF414141);
  static Color cardColor = Color(0xff3B82F6);
  static const String lexendFont = 'Lexend';
  static const String lnterFont = 'lnter';
  static const Color grey = Color(0xFFE0E0E0);
  static const Color lightGrey = Colors.grey;
  static const Color border = Color(0xFFEDEDED);
  static const Color lightBlue = Color(0xFFFAFAFA);
  static const Color divider = Color(0xFFF3F3F3);
  static const Color customContainer = Color(0xFFE7E7E7);
  static const Color purple = Color(0xFF6A00D4);
  static const Color pink = Color(0xFFcc3fa4);
  static const Color lightGreen = Color(0xFF19B791);
  static const Color whiteSmoke = Color(0xFFE4EDFB);
  static const Color greyBorder = Color(0xFFF7F7F7);
  static const Color vibrantBlue = Color(0xFF4DAAFF);
  static const Color textFieldBorder = Color(0x80D4D4D4);
  static const Color loadingButtonBack = Color(0xFFF7F7F7);
  static const Color loadingButtonload = Color(0xFFECE8FF);
  static const Color buttonBeforeSwap = Color(0xFFECE8FF);
  static const Color message = Colors.blue;
  static const Color ban = Color(0x80FF2C20);
  static const Color banWord = Color(0xFFFF2C20);
  static const Color searchingForTrip = Color(0xFFFFE1DF);
  static const Color searching = Color(0xFF98BEFD);
  static const Color opportunityBG = Color(0xFFF6F2FB);
  static const Color whiterpink = Color(0xFFECE8FF);


  static TextStyle lnterBoldFont = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.bold,
    fontFamily: AppStyle.lnterFont,
    color: AppStyle.black,
  );
  static const Color criminalCardBG = Color(0xFFFFE50D);
  static const Color sliderFirstCardBG = Color(0xFFFFD500);
  static const Color sliderSecCardBG = Color(0xFFC86BFA);
  static const Color sliderThirdCardBG = Color(0xFF3D0066);

  static setPinkMode(bool value) {
    if (value) {
      primaryColor = AppStyle.pink;
      darkPrimaryColor = AppStyle.pink;
      cardColor = AppStyle.pink;
    } else {
      primaryColor = const Color(0xFF5300BC);
      darkPrimaryColor = const Color(0xff004ec2);
      cardColor = const Color(0xff3B82F6);
    }
  }

  static ThemeData lightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppStyle.white,
      shape: RoundedRectangleBorder(borderRadius: bottomSheetBorderRadius),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: lnterFont,
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: black,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: greyColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: white,
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        fontFamily: lnterFont,
        height: 0.10,
      ),
      titleLarge: TextStyle(
        color: black,
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        fontFamily: 'Inter',
      ),
      titleSmall: TextStyle(
        color: black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'Inter',
      ),
      labelSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w200,
        color: white,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      titleMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      displayLarge: TextStyle(
        color: black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  static ThemeData pinklightTheme = ThemeData(
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppStyle.white,
      shape: RoundedRectangleBorder(borderRadius: bottomSheetBorderRadius),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    useMaterial3: true,
    fontFamily: lexendFont,
    primarySwatch: Colors.pink,
    primaryColor: pink,
    cardColor: pink,
    scaffoldBackgroundColor: white,
    appBarTheme: AppBarTheme(
      backgroundColor: white,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24.sp,
        color: black,
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(
        color: black,
        fontSize: 24.sp,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: greyColor,
        fontSize: 12.sp,
        fontWeight: FontWeight.w300,
      ),
      bodyMedium: TextStyle(
        color: white,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: white,
        fontSize: 14.spMin,
        fontWeight: FontWeight.w400,
        fontFamily: lnterFont,
        height: 0.10,
      ),
      titleLarge: TextStyle(
        color: black,
        fontSize: 32.sp,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w200,
      ),
      labelSmall: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
      ),
      labelLarge: TextStyle(
        color: black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      labelMedium: TextStyle(
        color: black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
      ),
      displaySmall: TextStyle(
        color: white,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w200,
        color: white,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: white,
      ),
      titleMedium: TextStyle(
        color: white,
        fontWeight: FontWeight.w600,
        fontSize: 18.sp,
      ),
      displayLarge: TextStyle(
        color: black,
        fontSize: 18.sp,
        fontWeight: FontWeight.w400,
      ),
      bodyLarge: TextStyle(
        color: black,
        fontSize: 28.sp,
        fontWeight: FontWeight.w700,
      ),
    ),
  );
  static BorderRadiusGeometry bottomSheetBorderRadius = BorderRadius.only(
    topRight: Radius.circular(24.r),
    topLeft: Radius.circular(24.r),
  );
  static BorderRadius defaultBorderRadius = BorderRadius.circular(12.r);
  static ThemeData darkTheme = ThemeData.dark(useMaterial3: true);
}
