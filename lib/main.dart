import 'package:flutter/material.dart';
import 'package:food_flutter/screens/splash_screen.dart';
import 'package:food_flutter/screens/start_login_screen.dart';
import 'package:food_flutter/screens/walktrough_screen.dart';
import 'package:food_flutter/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreen(),
        '/walk-trough' : (context) => const WalktroughScreen(),
        '/start-login' : (context) => const StartLoginScreen()
      },
      title: 'Foodiez',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
