import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_flutter/screens/welcome_screen.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ValueNotifier<double> counter = ValueNotifier(0);
  Timer? timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      counter.value += 10;
      if(counter.value == 130){
        timer?.cancel();
        /*
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
              const WelcomeScreen(),
              settings: const RouteSettings(
                  name: '/welcome'),
              fullscreenDialog: false,
              maintainState: true,
            ));

         */
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    counter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Image.asset("assets/splashIcon.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SimpleCircularProgressBar(
              backStrokeWidth: 0,
              mergeMode: true,
              valueNotifier: counter,
            ),
          )
        ],
      ),
    );
  }
}
