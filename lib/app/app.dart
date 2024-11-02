import 'package:flutter/material.dart';
import 'package:musicverse/app/src/features/home/home_screen.dart';
import 'package:musicverse/app/src/features/auth/login_screen.dart';

class MusicVerse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
