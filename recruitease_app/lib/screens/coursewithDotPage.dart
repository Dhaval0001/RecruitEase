import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruitease_app/screens/androidcourse.dart';
import 'package:recruitease_app/screens/blender3d.dart';
import 'package:recruitease_app/screens/cryptography.dart';

class CoursewithDotPage extends StatefulWidget {
  final List<String> imgList;
  final List names = [
    'Android',
    'Blender',
    'Cryptograhy'
  ];
  CoursewithDotPage({required this.imgList});

  @override
  State<CoursewithDotPage> createState() => _CoursewithDotPageState();
}

class _CoursewithDotPageState extends State<CoursewithDotPage> {
  int _current = 0;
  final List<String> courseNames = [
    'Android Development',
    'Blender 3D',
    'Cryptography',
  ];


  void navigateToAndroidCourse() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AndroidCourse()),
    );
  }

  void navigateToBlenderCourse() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BlenderCourse()),
    );
  }

  void navigateToCryptographyCourse() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CryptographyCourse()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = widget.imgList
        .map((item) => GestureDetector(
      onTap: () {
        if (_current == 0) {
          navigateToAndroidCourse();
        } else if (_current == 1) {
          navigateToBlenderCourse();
        } else if (_current == 2) {
          navigateToCryptographyCourse();
        }
      },
      child: Container(
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Stack(
            children: [
              Image.network(
                item,
                fit: BoxFit.cover,
                width: 400,
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(200, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0),
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Text(
                    courseNames[_current],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (_current == 0) {
              navigateToAndroidCourse();
            } else if (_current == 1) {
              navigateToBlenderCourse();
            } else if (_current == 2) {
              navigateToCryptographyCourse();
            }
          },
          child: CarouselSlider(
            items: imageSliders,
            options: CarouselOptions(
              autoPlay: false,
              enlargeCenterPage: true,
              aspectRatio: 2,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.imgList.map((url) {
            int index = widget.imgList.indexOf(url);
            return Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.grey : Colors.grey.shade300,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}