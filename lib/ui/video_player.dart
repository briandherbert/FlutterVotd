import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

/// Based on https://flutter.dev/docs/cookbook/plugins/play-video
class VideoPlayerScreen extends StatefulWidget {
  final String url;
  VideoPlayerScreen({Key key, @required String this.url}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;
  bool _isLoaded = false;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      widget.url,
    );

    // Initialize the controller and store the Future for later use
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure you dispose the VideoPlayerController to free up resources
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      backgroundColor: Colors.black,
      // Use a FutureBuilder to display a loading spinner while you wait for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the Aspect Ratio of the Video
            return Center(
              child: GestureDetector(
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video
                  child: VideoPlayer(_controller),
                ),

                onTap:  () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown
                  setState(() {
                    playOrPause();
                  });
                },
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Center(
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: _controller.value.isPlaying ?  Colors.transparent : Colors.black54,

          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown
            setState(() {
              playOrPause();
            });
          },
          // Display the correct icon depending on the state of the player.
          child: Icon(
            _controller.value.isPlaying ? null : Icons.play_arrow,
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void playOrPause() {
    if (_controller.value.isPlaying) {
      _controller.pause();
    } else {
      // If the video is paused, play it
      _controller.play();
    }
  }
}