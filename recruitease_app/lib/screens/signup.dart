import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recruitease_app/screens/signin.dart';
import 'package:recruitease_app/routes/routes.dart';
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

class SignUpScreen extends StatelessWidget {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignUpScreen({super.key});

  Future<void> signUserUp(BuildContext context) async {
    final BuildContext dialogContext = context; // Store the context for dialog

    final String email = emailController.text.trim();
    final String password = passwordController.text;
    final String confirmPassword = confirmPasswordController.text;

    if (password == confirmPassword) {
      if (password.length >= 8) {
        try {
          // Create the user with email and password
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Add user data to Firestore
          final User? user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
              'email': email,
              // Add more user data as needed
            });

            // Show a "Sign-up Successful" dialog
            showDialog(
              context: dialogContext,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Sign-up Failed'),
                  content: Text('Please Try Again!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Dismiss the "Sign-up Successful" dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInScreen()), // Navigate to SignInScreen
                        );
                      },
                      child: Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        } on FirebaseAuthException catch (error) {
          // Handle sign-up error
          print("Sign-up failed: $error");
          showDialog(
            context: dialogContext,
            builder: (context) {
              return AlertDialog(
                title: const Text('Sign-up Successful'),
                content: Text('You have successfully signed up!.'),
                actions: [
                  TextButton(
                    onPressed: () {
                        Navigator.of(context).pop(); // Dismiss the "Sign-up Successful" dialog
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignInScreen()), // Navigate to SignInScreen
                        );
                      },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      } else {
        // Password should be at least 8 characters long, show dialog
        showDialog(
          context: dialogContext,
          builder: (context) {
            return AlertDialog(
              title: Text('Invalid Password'),
              content: Text('The password should be at least 8 characters long.'),
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
    } else {
      // Passwords don't match, show dialog
      showDialog(
        context: dialogContext,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Doesn\'t Match'),
            content: Text('The entered passwords do not match.'),
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
    height: MediaQuery.of(context).size.height;
    width: MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height*0.15),
                Text(
                  'Welcome to RecruitEase!',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(29, 93, 155,1),
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Sign Up to continue',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(29, 93, 155,1),
                  ),
                ),
                SizedBox(
                  height: 4 * 8.0,
                ), // 4 lines of spacing (each line is 8.0)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                PasswordTextField(
                  controller: confirmPasswordController,
                  labelText: 'Confirm Password',
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                //   child: TextFormField(
                //     controller: passwordController,
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       labelText: 'Password',
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20.0),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                //   child: TextFormField(
                //     controller: confirmPasswordController,
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       labelText: 'Confirm Password',
                //     ),
                //   ),
                // ),
                SizedBox(height: 40.0),
                Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Container(
                        width: 300,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            signUserUp(context); 
                            // Handle Register button press
                            //Navigator.of(context).pushNamed(RouteManager.login);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color.fromRGBO(29, 93, 155,1)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ),
                          child: const Text(
                            'Sign up',
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
                // Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(horizontal: 20.0),
                //   child: ElevatedButton(
                //     onPressed: () {
                //       signUserUp(context); // Call the signUserUp method
                //     },
                //     child: Text('Sign up'),
                //   ),
                // ),
                // SizedBox(height: 10.0),
                // GestureDetector(
                //   onTap: () {
                //     // Add your forgot password logic here
                //   },
                //   child: Text(
                //     'Forgot password',
                //     style: TextStyle(
                //       fontSize: 16.0,
                //       fontWeight: FontWeight.bold,
                //       color: Colors.blue,
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20.0),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     // GestureDetector(
                //     //   onTap: () {
                //     //     // Add your Google sign-in logic here
                //     //   },
                //     //   child: Image.asset(
                //     //     'lib/assets/images/google.png', // Replace with your Google image path
                //     //     height: 50.0,
                //     //     width: 50.0,
                //     //   ),
                //     // ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
