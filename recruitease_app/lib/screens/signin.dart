// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recruitease_app/routes/routes.dart';
import 'package:recruitease_app/services/auth_service.dart';
import 'package:recruitease_app/utils/size_utils.dart';

class PasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;

  PasswordTextField({
    required this.controller,
    required this.labelText,
  });

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: widget.controller,
        obscureText: _obscureText,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
        ),
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  SignInScreen({super.key});

  Future<void> signUserIn(BuildContext context) async {
    final String email = emailController.text.trim();
    final String password = passwordController.text;

    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Login successful, navigate to the home page
      Navigator.of(context).pushNamed(RouteManager.homePage);
    } catch (error) {
      // Handle login error
      print("Login failed: $error");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Login Failed'),
            content: Text('Error: ${error.toString()}'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.08),
                Text(
                  'Welcome back!',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(29, 93, 155, 1)),
                ),
                SizedBox(height: 10.0),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(29, 93, 155, 1)),
                ),
                SizedBox(height: 4 * 8.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                PasswordTextField(
                  controller: passwordController,
                  labelText: 'Password',
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: Container(
                          width: 300,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              signUserIn(context);
                              // Handle Register button press
                              //Navigator.of(context).pushNamed(RouteManager.login);
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Color.fromRGBO(29, 93, 155, 1)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ),
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // Add your forgot password logic here
                    Navigator.of(context)
                        .pushNamed(RouteManager.forgetpassword);
                  },
                  child: Text(
                    'Forgot password',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () => AuthService().signInWithGoogle(context),
                      child: Image.asset(
                        'lib/assets/images/google.png',
                        height: 50.0,
                        width: 50.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
