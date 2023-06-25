import 'package:flutter/material.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:universal_html/html.dart' as html;

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
                  userAgent.contains('mac os')
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: ButtonWithIcon(
                    backgroundColor: Color(0x0f35383f),
                    imageAsset: "assets/appleIcon.png",
                    btnText: "Continue with Apple",
                  ),
                )
              : const SizedBox.shrink(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'or',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                ),
              ],
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
              onPressed: () {},
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don’t have an account?',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Color(0xFF1BAC4B), fontSize: 15),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
