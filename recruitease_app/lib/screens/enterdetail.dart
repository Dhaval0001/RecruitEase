import 'package:flutter/material.dart'
    show
        Align,
        Alignment,
        BuildContext,
        Colors,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        ElevatedButton,
        FontWeight,
        InputDecoration,
        MainAxisAlignment,
        MediaQuery,
        Padding,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        StatelessWidget,
        Text,
        TextField,
        TextStyle,
        Widget;

class EnterDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          //padding: const EdgeInsets.only(top: 20),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .15,
              ),
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: IconButton(
              //     icon: Icon(Icons.arrow_back),
              //     onPressed: () {
              //       Navigator.pop(context); // Add your back button logic here
              //     },
              //   ),
              // ),
              SizedBox(height: 20.0),
              Text(
                'Enter your details',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
              // SizedBox(height: 20.0),
              // TextField(
              //   decoration: InputDecoration(
              //     labelText: 'Confirm Email',
              //     labelStyle: TextStyle(color: Colors.black),
              //   ),
              //   style: TextStyle(color: Colors.black),
              // ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
                obscureText: true,
              ),
              SizedBox(height: 40.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your continue button logic here
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                    ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
