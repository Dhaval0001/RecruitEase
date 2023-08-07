import 'package:recruitease_app/constant/BottomNavPage.dart';
import 'package:recruitease_app/screens/coursewithDotPage.dart';
import 'package:flutter/material.dart';

class courseDetailPage extends StatefulWidget {
  const courseDetailPage({super.key});

  @override
  State<courseDetailPage> createState() => _courseDetailPageState();
}

class _courseDetailPageState extends State<courseDetailPage> {

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2072&q=80',
    'https://images.unsplash.com/photo-1571171637578-41bc2dd41cd2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80',
    'https://images.unsplash.com/photo-1593720213428-28a5b9e94613?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80',
    //'https://images.unsplash.com/photo-1505373877841-8d25f7d46678?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2012&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBottom(
          c: context,
          selectedIndex: 1,
        ),
      appBar: AppBar(
                centerTitle: true,
        backgroundColor: Color.fromRGBO(29, 93, 155,1),
        elevation: 0,
        title: Text("My Courses",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20
        ),),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(padding: EdgeInsets.all(20),
              child: Text("Courses Completed",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 19
              ),
              ),),
              CoursewithDotPage(imgList: imgList),
              // CarouselSlider(
              //     items: imgList.map((item) => Container(
              //       child: Center(
              //         child: Image.network(
              //           item,
              //           fit: BoxFit.cover,
              //           width: 1000,),),)).toList(),
              //     options: CarouselOptions(
              //       autoPlay: false,
              //       aspectRatio: 2.0,
              //       enlargeCenterPage: true
              //     )),
              Padding(padding: EdgeInsets.all(20),
                child: Text("Courses in progress",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 19
                  ),
                ),),
              CoursewithDotPage(imgList: imgList),
            ],
          ),
        ),
      ),
    );
  }
}