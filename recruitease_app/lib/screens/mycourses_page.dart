import 'package:flutter/material.dart';

import 'courseDetailPage.dart';

class mycourses_page extends StatefulWidget {
  const mycourses_page({super.key});

  @override
  State<mycourses_page> createState() => mycourses_pageState();
}

class mycourses_pageState extends State<mycourses_page> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomAppBar(),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 18, right: 18, top: 15, bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                "Vehement",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                "What do you wanna learn today?",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8),
              child: Text(
                "Top Courses",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridB(),
            SizedBox(
              height: 20,
            ),
            // Expanded(
            //   child: Gridview.count(
            //     crossAxisCount: 2,
            //     shrinkWrap: true,
            //     children: [
            // Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: Card(
            //     elevation: 2,
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(20),
            //     ),
            //     margin: EdgeInsets.only(left: 10, right: 5, bottom: 10),
            //     child: InkWell(
            //       onTap: () {
            //         Navigator.push(context,
            //             MaterialPageRoute(builder: (context) => courseDetailPage()));
            //       },
            //       child: Padding(
            //         padding: EdgeInsets.all(10),
            //         child: Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             Text(
            //               "Google",
            //               style: TextStyle(
            //                 color: Color(0xff5c62d6),
            //                 fontSize: 30,
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            //     ]
            //   )
            // )
          ],
        ),
      ),
    );
  }
}

class GridB extends StatefulWidget {
  const GridB({super.key});

  @override
  State<GridB> createState() => _GridBState();
}

class _GridBState extends State<GridB> {
  final List _courses = [
    'Google',
    'Amazon',
    'ABC',
  ];

  @override
  Widget build(BuildContext context) {
    double height;
    height = MediaQuery.of(context).size.width / 2 + 105;
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1, crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: _courses.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => courseDetailPage()));
            },
            child: Container(
              height: height / 2,
              width: double.infinity / 2,
              decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(5)),
              margin:
              const EdgeInsets.only(left: 8, right: 8, bottom: 10, top: 10),
              //padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  _courses[index],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        });
  }
}