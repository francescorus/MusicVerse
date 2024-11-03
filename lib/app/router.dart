import 'package:flutter/material.dart';

import 'package:musicverse/app/src/features/auth/login_screen.dart';
import 'package:musicverse/app/src/features/auth/signup_screen.dart';
import 'package:musicverse/app/src/features/home/home_screen.dart';

class MusicVerseRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => SignupScreen());
      case '/home':
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
