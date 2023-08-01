import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/utils/database_operations.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:food_flutter/widget/line_text_widget.dart';
import 'package:food_flutter/widget/text_with_button.dart';

import '../utils/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final fullNameController = TextEditingController();
  bool passToggle = true;

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
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Image.asset('assets/logo.png'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Create New Account",
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
              key: _formField,
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
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: fullNameController,
                    decoration: InputDecoration(
                      labelText: "FullName",
                      labelStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                    style: const TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) return "Enter fullName";
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
                      if (_formField.currentState!.validate()) {
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
                              .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passController.text,
                          );
                          DatabaseOperations.saveUserData({
                            'email': emailController.text,
                            'fullName': fullNameController.text
                          },context);
                        } on FirebaseAuthException catch (e) {
                          Navigator.of(context).pop(); // Close the dialog
                        }
                        emailController.clear();
                        passController.clear();
                        fullNameController.clear();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Sign Up",
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
            text: 'Already have an account?',
            btnText: 'Sign in',
            btnFun: () {
              Navigator.pushNamed(context, '/login');
            },
            btnColor: const Color(0xFF1BAC4B),
          ),
        ],
      ),
    );
  }
}
