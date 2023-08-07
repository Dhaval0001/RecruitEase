import 'package:flutter/material.dart';
import 'package:recruitease_app/constant/BottomNavPage.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  Widget prefixIcon() {
    return Container(
      height: 40,
      width: 40,
      padding: EdgeInsets.all(10),
      decoration:
      BoxDecoration(shape: BoxShape.circle, color: Colors.transparent),
      child: Icon(
        Icons.notifications_rounded,
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
        bottomNavigationBar: NavBottom(
          c: context,
          selectedIndex: 0,
        ),
        appBar: AppBar(
           centerTitle: true,
          backgroundColor: Color.fromRGBO(29, 93, 155,1),
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Notifications',
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
        body: ListView(
          children: <Widget>[
            ListTile(
              leading: prefixIcon(),
              title: Text('You registered for UI UX course'),
              subtitle: Text('03 minutes ago'),
            ),
            ListTile(
              leading: prefixIcon(),
              title: Text('Your account is verified'),
              subtitle: Text('05 minutes ago'),
            ),
            ListTile(
              leading: prefixIcon(),
              title: Text('You created an account using..'),
              subtitle: Text('08 minutes ago'),
            ),
          ],
        ),
      ),
    );
  }
}
