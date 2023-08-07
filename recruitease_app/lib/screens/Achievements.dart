import 'package:flutter/material.dart';
import 'package:recruitease_app/screens/profile.dart';

import '../constant/BottomNavPage.dart';

class Achievement extends StatelessWidget {
  const Achievement({Key? key}) : super(key: key);

  Widget prefixIcon() {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(10),
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
      child: Icon(
        Icons.emoji_events,
        size: 20,
        color: Colors.blue,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color.fromRGBO(29, 93, 155,1),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Achievements',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
         
          // leading: Icon(
          //   Icons.arrow_back_ios_rounded,
          //   size: 20,
          //   color: Colors.black,
          // ),
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   title: Text('ACHIEVEMENTS',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //       )),
        //   leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //             builder: (context) => Profile(
        //                   userEmail: 'userEmail',
        //                 )),
        //       );
        //     },
        //     icon: const Icon(
        //       Icons.arrow_back_ios_rounded,
        //       size: 20,
        //       color: Colors.black,
        //     ),
        //   ),
        //   // leading: Icon(
        //   //   Icons.arrow_back_ios_rounded,
        //   //   size: 20,
        //   //   color: Colors.black,
        //   //   onPressed: () {
        //   //     Navigator.push(
        //   //       context,
        //   //       MaterialPageRoute(builder: (context) => Profile(userEmail: 'userEmail',)),
        //   //     );
        //   //   },
        //   // ),
        // ),
        body: ListView(
          padding: EdgeInsets.only(top: 16.0),
          children: <Widget>[
            ListTile(
              leading: prefixIcon(),
              title: Text('Certifications',
              style: TextStyle(
                color: Colors.black,
                 fontSize: 19,
                 fontWeight: FontWeight.w500,
              ),),
              trailing: const Text('5',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  )),
            ),
            ListTile(
                leading: prefixIcon(),
                title: Text('Courses in progress',
                 style: TextStyle(
                color: Colors.black,
                 fontSize: 19,
                 fontWeight: FontWeight.w500,
              )),
                trailing: const Text('2',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ))),
            ListTile(
                leading: prefixIcon(),
                title: Text('Courses Completed',
                 style: TextStyle(
                color: Colors.black,
                 fontSize: 19,
                 fontWeight: FontWeight.w500,
              )),
                trailing: const Text('3',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ))),
          ],
        ),
        bottomNavigationBar: NavBottom(
          c: context,
          selectedIndex: 2,
        ),
      ),
    );
  }
}
