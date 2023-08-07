import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AndroidCourse(),
    );
  }
}

class AndroidCourse extends StatefulWidget {
  @override
  _AndroidCourseState createState() => _AndroidCourseState();
}

class _AndroidCourseState extends State<AndroidCourse> {
  late YoutubePlayerController _controller;
  String currentVideoId = 'yaZ66V0mKSM';
  String appBarTitle = 'Android Developer fundamentals';
  bool isFullScreen = false;
  double videoAspectRatio = 16 / 12;

  @override
  void initState() {
    super.initState();

    _controller = YoutubePlayerController(
      initialVideoId: currentVideoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(() {
        if (_controller.value.isFullScreen != isFullScreen) {
          setState(() {
            isFullScreen = _controller.value.isFullScreen;
            // Update the video aspect ratio based on full-screen state
            videoAspectRatio = isFullScreen ? 16 / 9 : 14 / 12;
          });
          SystemChrome.setEnabledSystemUIMode(
            isFullScreen
                ? SystemUiMode.immersive
                : SystemUiMode.manual,
            overlays: [
              SystemUiOverlay.top,
              SystemUiOverlay.bottom,
            ],
          );
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void navigateToVideo(String videoId, String title) {
    setState(() {
      currentVideoId = videoId;
      appBarTitle = title;
      _controller.load(videoId); // Update the video ID
    });
  }

  Widget buildVideoPlayer() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final videoWidth = constraints.maxWidth;
        final videoHeight = videoWidth / videoAspectRatio;
        return YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          aspectRatio: videoWidth / videoHeight,
          onReady: () {
            _controller.play();
          },
        );
      },
    );
  }

  Widget buildTextWidgets() {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: 16),
            GestureDetector(
              onTap: () =>
                  navigateToVideo('xNPkXGdVw7E', 'Introuction to Android'),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Introuction to Android',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => navigateToVideo('6uWPMcJLrC4', 'First Appliction'),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'First Appliction',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () =>
                  navigateToVideo('9-cGAXbuoRI', 'Layout, Views and Resources'),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Layout, Views and Resources',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () =>
                  navigateToVideo('yAbK5kakKWM', 'Android Resourses'),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Android Resourses',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16), // Add some space after the last item
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ]);

    return Scaffold(
      appBar: isFullScreen
          ? null
          : AppBar(
            backgroundColor: Color.fromRGBO(29, 93, 155,1),
              title: Text(
                appBarTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildVideoPlayer(),
            buildTextWidgets(), // Wrap text widgets with SingleChildScrollView
          ],
        ),
      ),
    );
  }
}
