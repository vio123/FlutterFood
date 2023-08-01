import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/utils/auth_service.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:food_flutter/widget/line_text_widget.dart';
import 'package:food_flutter/widget/text_with_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formField1 = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 70),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Login to Your Account",
              style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: _formField1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        prefixIcon: const Icon(Icons.email),
                      ),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) return "Enter email";
                        bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value);
                        if (!emailValid) {
                          return "Enter Valid Email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passController,
                      obscureText: passToggle,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                            onTap: () {
                              setState(() {
                                passToggle = !passToggle;
                              });
                            },
                            child: Icon(passToggle
                                ? Icons.visibility
                                : Icons.visibility_off),
                          )),
                      style: const TextStyle(color: Colors.white),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Password";
                        } else if (passController.text.length < 6) {
                          return "Password Length Should be more than 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1BAC4B)),
                      onPressed: () async {
                        if (_formField1.currentState!.validate()) {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: Row(
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(width: 15),
                                    Text("Se încarcă..."),
                                  ],
                                ),
                              );
                            },
                          );
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passController.text);
                            Navigator.pushReplacementNamed(context, '/');
                            //Navigator.of(context).pop(); // Close the dialog
                          } on FirebaseAuthException catch (e) {
                            Navigator.of(context).pop(); // Close the dialog
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Incorrect email or password"),
                                // Display the error message dynamically
                                duration: Duration(seconds: 3),
                              ),
                            );
                          }
                          emailController.clear();
                          passController.clear();
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              child: LineTextWidget(
                text: 'or continue with',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWithIcon(
                    backgroundColor: const Color(0x0f35383f),
                    imageAsset: "assets/googleIcon.png",
                    sizedBox: 0,
                    width: 20,
                    height: 10,
                    onClick: () {
                      if (kIsWeb) {
                        AuthService.signInWithGoogleWeb().then((value) {
                          Navigator.pushReplacementNamed(context, '/');
                        });
                      } else {
                        AuthService.signInWithGoogle().then((value) {
                          Navigator.pushReplacementNamed(context, '/');
                        });
                      }
                    },
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ButtonWithIcon(
                    backgroundColor: const Color(0x0f35383f),
                    imageAsset: "assets/appleIcon.png",
                    sizedBox: 0,
                    width: 20,
                    height: 10,
                    onClick: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextWithButton(
              text: 'Don’t have an account?',
              btnText: 'Sign up',
              btnFun: () {
                Navigator.pushNamed(context, '/register');
              },
              btnColor: const Color(0xFF1BAC4B),
            ),
          ],
        ),
      ),
    );
  }
}
