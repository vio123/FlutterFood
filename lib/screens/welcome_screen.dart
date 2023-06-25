import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_flutter/screens/walktrough_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      /*
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const WalktroughScreen(),
            settings: const RouteSettings(
                name: '/walk-trough'),
            fullscreenDialog: false,
            maintainState: true,
          ));

       */
      Navigator.pushReplacementNamed(context, '/walk-trough');
    });
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // Calculăm dimensiunea fontului în funcție de lățimea ecranului
    var welcomeFontSize = 50;
    var textFontSize = 18;
    double responsiveWelcomeFontSize = 0.0;
    double responsiveFontSize = 0.0;
    if(MediaQuery.of(context).orientation == Orientation.portrait){
      setState(() {
        responsiveWelcomeFontSize =  welcomeFontSize * screenWidth / 375.0;
        responsiveFontSize = textFontSize * screenWidth / 375.0;
      });
    }else{
      setState(() {
        responsiveWelcomeFontSize =  welcomeFontSize * screenHeight / 375.0;
        responsiveFontSize = textFontSize * screenHeight / 375.0;
      });
    }
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/welcomeBackground.png"),
            fit: BoxFit.fill),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Welcome to Foodu! 👋",
                style: TextStyle(
                  fontSize: responsiveWelcomeFontSize,
                  decoration: TextDecoration.none,
                  color: const Color(0xFF1BAC4B)
                ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
              style: TextStyle(
                  fontSize: responsiveFontSize,
                  decoration: TextDecoration.none,
                  color: Colors.white
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
