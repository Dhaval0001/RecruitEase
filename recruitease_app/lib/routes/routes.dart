import 'package:flutter/material.dart';
import 'package:recruitease_app/screens/Achievements.dart';
import 'package:recruitease_app/screens/Authentation.dart';
import 'package:recruitease_app/screens/NotificationScreen.dart';
import 'package:recruitease_app/screens/androidcourse.dart';
import 'package:recruitease_app/screens/blender3d.dart';
import 'package:recruitease_app/screens/courseAndroidDetail.dart';
import 'package:recruitease_app/screens/courseBlenderDetail.dart';
import 'package:recruitease_app/screens/cryptography.dart';
import 'package:recruitease_app/screens/enterdetail.dart';
import 'package:recruitease_app/screens/forgetpassword.dart';
import 'package:recruitease_app/screens/homepage.dart';
import 'package:recruitease_app/screens/profile.dart';
import 'package:recruitease_app/screens/signin.dart';
import 'package:recruitease_app/screens/signup.dart';
import 'package:recruitease_app/screens/course_detail_screen.dart';

import '../screens/companyPage.dart';

class RouteManager {
  static const String authenticationPage = '/';
  static const String homePage = '/HomePage';
  static const String notification = '/NotificationScreen';
  static const String achievement = '/Achievement';
  static const String detailsPage = '/DetailsPage';
  static const String registration = '/SignUp';
  static const String login = '/SignIn';
  static const String profile = '/Profile';
  static const String forgetpassword = '/Password';
  static const String coursedetailscreen = '/CourseCrpytoScreen';
  static const String companypage = '/CompanyPage';
  static const String videopage1 = '/AndroidCourse';
  static const String videopage2 = '/BlenderCourse';
  static const String videopage3 = '/CryptographyCourse';
  static const String boxpage1 = '/CourseAndroidScreen';
  static const String boxpage2 = '/CourseBlenderScreen';
  static const String boxpage3 = '/CourseCrpytoScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case authenticationPage:
        return MaterialPageRoute(
          builder: (context) => Authentation(),
        );

      case notification:
        return MaterialPageRoute(
          builder: (context) => NotificationScreen(),
        );

      case detailsPage:
        return MaterialPageRoute(
          builder: (context) => EnterDetailsPage(),
        );

      case registration:
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );

      case login:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
        );

      case profile:
        return MaterialPageRoute(
          builder: (context) => Profile(
            userEmail: 'userEmail',
          ),
        );

      case achievement:
        return MaterialPageRoute(
          builder: (context) => Achievement(),
        );

      case forgetpassword:
        return MaterialPageRoute(
          builder: (context) => ForgotPasswordScreen(),
        );

      case coursedetailscreen:
        return MaterialPageRoute(
          builder: (context) => CourseCrpytoScreen(),
        );

      case companypage:
        return MaterialPageRoute(
          builder: (context) => CompanyPage(),
        );

      case videopage1:
        return MaterialPageRoute(
          builder: (context) => AndroidCourse(),
        );

      case videopage2:
        return MaterialPageRoute(
          builder: (context) => BlenderCourse(),
        );

      case videopage3:
        return MaterialPageRoute(
          builder: (context) => CryptographyCourse(),
        );

      case boxpage1:
        return MaterialPageRoute(
          builder: (context) => CourseAndroidScreen(),
        );

      case boxpage2:
        return MaterialPageRoute(
          builder: (context) => CourseBlenderScreen(),
        );

      case boxpage3:
        return MaterialPageRoute(
          builder: (context) => CourseCrpytoScreen(),
        );

      default:
        throw FormatException('Route Not found! Check Routes Page');
    }
  }
}