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
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
              settings: const RouteSettings(name: '/splash'),
              fullscreenDialog: false,
              maintainState: true,
            );
          case '/welcome':
            return MaterialPageRoute(
              builder: (context) => const WelcomeScreen(),
              settings: const RouteSettings(name: '/welcome'),
              fullscreenDialog: false,
              maintainState: true,
            );
          case '/walk-trough':
            return MaterialPageRoute(
              builder: (context) => const WalktroughScreen(),
              settings: const RouteSettings(name: '/walk-trough'),
              fullscreenDialog: false,
              maintainState: true,
            );
          case '/start-login':
            return MaterialPageRoute(
              builder: (context) => const StartLoginScreen(),
              settings: const RouteSettings(name: '/start-login'),
              fullscreenDialog: false,
              maintainState: true,
            );
        }
      },
      title: 'Foodiez',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
