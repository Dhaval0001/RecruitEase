import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _confirmEmailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _confirmEmailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword(BuildContext context) async {
    final String email = _emailController.text.trim();

    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset'),
            content: Text('A password reset link has been sent to your email.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                  Navigator.pushNamed(context, '/login'); // Replace '/login' with your login screen route
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      print('Password reset failed: $error');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Password Reset Failed'),
            content: Text('Failed to send the password reset email.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
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
    double height;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: height * .15,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Want to reset your password?',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email', // Update label to "Email"
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: _confirmEmailController,
                      decoration: InputDecoration(
                        labelText: 'Confirm Email', // Update label to "Confirm Email"
                      ),
                      validator: (value) {
                        final email = _emailController.text;
                        if (value?.isEmpty ?? true) {
                          return 'Please confirm your email';
                        } else if (value != email) {
                          return 'Emails do not match';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          resetPassword(context); // Call the resetPassword method
                        }
                      },
                      child: Text('Reset Password'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
