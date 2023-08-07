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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  String currentVideoId = 'lNQJNImBsKY';
  String appBarTitle = 'Flutter Course';
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
    if (isFullScreen) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final videoWidth = constraints.maxWidth;
          final videoHeight = videoWidth / videoAspectRatio;
          return Container(
            width: videoWidth,
            height: videoHeight,
            child: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              aspectRatio: videoWidth / videoHeight,
              onReady: () {
                _controller.play();
              },
            ),
          );
        },
      );
    } else {
      return YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        onReady: () {
          _controller.play();
        },
      );
    }
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
      body: Center(
        child: Column(
          children: [
            buildVideoPlayer(),
            SizedBox(height: 16),
            GestureDetector(
              onTap: () =>
                  navigateToVideo('yFlvgI6Z9bE', 'Flutter Integration'),
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
                      'Flutter Integration',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => navigateToVideo('hgTLtOVujAE', 'Flutter Doctor'),
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
                      'Flutter Doctor',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () =>
                  navigateToVideo('qal34e9v_pk', 'Flutter in VS Code'),
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
                      'Flutter in VS Code',
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
