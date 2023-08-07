// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recruitease_app/screens/Achievements.dart';
import 'package:recruitease_app/screens/Authentation.dart';
import 'package:recruitease_app/screens/NotificationScreen.dart';
import 'package:recruitease_app/screens/homepage.dart';
import 'package:recruitease_app/screens/mycourses_page.dart';

import 'CompanyPage.dart';

class Profile extends StatelessWidget {
  final String userEmail;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Profile({Key? key, required this.userEmail}) : super(key: key);
  Future<void> _logout(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          content: Text('Are you sure you want to logout?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500
          ),),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel',
              style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600
          ),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Logout',
               style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600
          ),),
              onPressed: () async {
                Navigator.of(context).pop();
                try {
                  await _auth.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Authentation()),
                  );
                } catch (e) {
                  print(e.toString());
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = _auth.currentUser;
    double height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // appBar: AppBar(
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back),
        //     color: Colors.black,
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => HomePage()),
        //       );
        //     },
        //   ),
        //   title: Text(
        //     '',
        //     style: TextStyle(
        //       color: Colors.black,
        //     ),
        //   ),
        //   backgroundColor: Colors.white,
        //   systemOverlayStyle: SystemUiOverlayStyle.dark,
        // ),
        backgroundColor: Color.fromARGB(255, 254, 255, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * 0.15),
                CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('lib/assets/images/profile.png'),
                ),
                SizedBox(height: 10),
                Text(
                  "User", // Display the user's email
                  style: TextStyle(
                    fontFamily: 'Source Sans 3',
                    fontSize: 20.0,
                    color: Color.fromRGBO(29, 93, 155,1),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                 user?.email ?? '',
                  style: TextStyle(
                    fontFamily: 'Pacifico',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 150.0,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Card(
                  color: Color.fromRGBO(29, 93, 155,1),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.library_books,
                      color: const Color.fromARGB(255, 241, 236, 236),
                    ),
                    title: Text(
                      'My Courses',
                      style: TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 245, 243, 243),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CompanyPage()),
                    ),
                  ),
                ),
                Card(
                  color:Color.fromRGBO(29, 93, 155,1), 
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: const Color.fromARGB(255, 233, 229, 229),
                    ),
                    title: Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 238, 236, 236),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationScreen(),
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Color.fromRGBO(29, 93, 155,1),
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.emoji_events,
                      color: const Color.fromARGB(255, 238, 236, 236),
                    ),
                    title: Text(
                      'Achievements',
                      style: TextStyle(
                        fontFamily: 'Source Sans 3',
                        fontSize: 20.0,
                        color: const Color.fromARGB(255, 243, 240, 240),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Achievement()),
                    ),
                  ),
                ),
                SizedBox(height: 8 * 8.0),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(29, 93, 155,1),
                      padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                    ),
                    child: Text('Log out',
                    style: TextStyle(
                      fontSize: 20
                    ),),
                    onPressed: () => _logout(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
