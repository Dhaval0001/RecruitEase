import 'package:flutter/material.dart';

import '../constant/BottomNavPage.dart';
import 'courseDetailPage.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavBottom(
          c: context,
          selectedIndex: 1,
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor:Color.fromRGBO(29, 93, 155,1),
          title: Text("Company",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.only(left: 18,right: 18,top: 15,bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8),
                child: Text(
                  "Hi, there!",
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
              Expanded(child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.only(left: 8, right: 5, bottom: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => courseDetailPage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Google",
                                style: TextStyle(
                                   color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.only(left: 8, right: 5, bottom: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => courseDetailPage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "DreamWorks",
                                style: TextStyle(
                                   color: Colors.black,
                                   fontWeight: FontWeight.w600,
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      margin: EdgeInsets.only(left: 8, right: 5, bottom: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => courseDetailPage()));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "IBM",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}