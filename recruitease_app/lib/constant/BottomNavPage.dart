import 'package:flutter/material.dart';
import 'package:recruitease_app/screens/Achievements.dart';
import 'package:recruitease_app/screens/homepage.dart';
import 'package:recruitease_app/screens/mycourses_page.dart';
import 'package:recruitease_app/screens/profile.dart';
import 'package:recruitease_app/screens/CompanyPage.dart';

// ignore: must_be_immutable
class NavBottom extends StatefulWidget {
  int selectedIndex = 0;
  BuildContext c;
  var varvalue;

  NavBottom({this.selectedIndex = 0, required this.c, this.varvalue}) : super();

  @override
  State<NavBottom> createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.home,
                size: 25,
                color: Colors.lightBlueAccent,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.bookmark_add,
                size: 25,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.bookmark_add,
                size: 25,
                color: Colors.lightBlueAccent,
              ),
              label: 'My Courses'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star_border,
                size: 25,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.star_border,
                size: 25,
                color: Colors.lightBlueAccent,
              ),
              label: 'Achievements'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 25,
                color: Colors.white,
              ),
              activeIcon: Icon(
                Icons.person_outline,
                size: 25,
                color: Colors.lightBlueAccent,
              ),
              label: 'Profile'),
        ],
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(29, 93, 155,1),
        unselectedItemColor: Colors.white70,
        fixedColor: Colors.lightBlueAccent,
        onTap: onPressed,
      ),
    );
  }

  void onPressed(int index) {
    setState(() {
      if (index == 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else if (index == 1) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CompanyPage()));
      } else if (index == 2) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Achievement()));
      } else if (index == 3) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Profile(
                  userEmail: 'userEmail',
                )));
      }
    });
  }
}