import 'package:flutter/material.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:food_flutter/widget/line_text_widget.dart';
import 'package:food_flutter/widget/text_with_button.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io' show Platform;

class StartLoginScreen extends StatefulWidget {
  const StartLoginScreen({super.key});

  @override
  State<StartLoginScreen> createState() => _StartLoginScreenState();
}

class _StartLoginScreenState extends State<StartLoginScreen> {
  String userAgent = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      userAgent = html.window.navigator.userAgent.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 70,
              ),
              child: Image.asset(
                "assets/startLoginIcon.png",
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Let’s you in",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: ButtonWithIcon(
              backgroundColor: Color(0x0f35383f),
              imageAsset: "assets/googleIcon.png",
              btnText: "Continue with Google",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          userAgent.contains('iphone') ||
                  userAgent.contains('ipad') ||
                  userAgent.contains('mac os') ||
                  Platform.isMacOS ||
                  Platform.isIOS
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ButtonWithIcon(
                    backgroundColor: Color(0x0f35383f),
                    imageAsset: "assets/appleIcon.png",
                    btnText: "Continue with Apple",
                  ),
                )
              : const SizedBox.shrink(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: LineTextWidget(
              text: 'or',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1BAC4B)),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                "Sign in with email",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextWithButton(
            text: 'Don’t have an account?',
            btnText: 'Sign up',
            btnFun: () {},
            btnColor: const Color(0xFF1BAC4B),
          ),
        ],
      ),
    );
  }
}
