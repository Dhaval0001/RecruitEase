import 'package:firebase_auth/firebase_auth.dart' show FirebaseAuth;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recruitease_app/constant/BottomNavPage.dart';
import 'package:recruitease_app/screens/CompanyPage.dart';
import 'package:recruitease_app/screens/androidcourse.dart';
import 'package:recruitease_app/screens/blender3d.dart';
import 'package:recruitease_app/screens/courseAndroidDetail.dart';
import 'package:recruitease_app/screens/courseBlenderDetail.dart';
import 'package:recruitease_app/screens/course_detail_screen.dart';
import 'package:recruitease_app/screens/cryptography.dart';
import 'package:recruitease_app/screens/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController();
  int currentIndex = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    super.initState();
    pages = [
      HomeContent(),
      CompanyPage(),
      Placeholder(), // Placeholder for Achievements page
      Profile(
        userEmail: 'userEmail',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color.fromRGBO(29, 93, 155,1),
        title: Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: NavBottom(
        c: context,
        selectedIndex: 0,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
    final List<String> courseNames = [
    'Web development',
    'Managing Innovation',
    'AI algorithms for Gaming',
  ];
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = FirebaseAuth.instance.currentUser;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                child: Text(
                  'What do you want to learn today?',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                child: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage(
                    'lib/assets/images/profile.png',
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Companies Specialization',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  _buildSpecializationBox(context, 'Android', Color.fromRGBO(29, 93, 155,1), 150.0, AndroidCourse()), // Link to Android page
                  _buildSpecializationBox(context, 'Blender', Color.fromRGBO(29, 93, 155,1), 150.0, BlenderCourse()), // Link to Blender page
                  _buildSpecializationBox(context, 'Cryptography', Color.fromRGBO(29, 93, 155,1), 150.0, CryptographyCourse()), // Link to Cryptography page
                ],
              ),
            ),
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'Popular on RecruitEase',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
  shrinkWrap: true,
  physics: NeverScrollableScrollPhysics(),
  itemCount: 3,
  itemBuilder: (context, index) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10),
      child: Container(
        height: 100.0,
        margin: EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            title: Text(courseNames[index],
            style: TextStyle(
              fontSize: 17.5,
              fontWeight: FontWeight.w500
            ),),
            onTap: () {
              // Navigate to the appropriate page based on the index
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseAndroidScreen()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseBlenderScreen()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseCrpytoScreen()),
                );
              }
            },
          ),
        ),
      ),
    );
  },
),

          // ListView.builder(
          //   shrinkWrap: true,
          //   physics: NeverScrollableScrollPhysics(),
          //   itemCount: 3,
          //   itemBuilder: (context, index) {
          //     return Padding(
          //       padding: const EdgeInsets.only(left: 10.0,right: 10),
          //       child: Container(
          //         height: 100.0,
          //         margin: EdgeInsets.all(8.0),
          //         child: Card(
          //           child: ListTile(
          //             title: Text('Course $index'),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }

  Widget _buildSpecializationBox(BuildContext context, String title, Color color, double width, Widget pageRoute) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => pageRoute),
        );
      },
      child: Container(
        width: width,
        height: 100.0,
        margin: EdgeInsets.all(8.0),
        color: color,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}