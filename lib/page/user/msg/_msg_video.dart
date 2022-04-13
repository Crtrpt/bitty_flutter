import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MsgVideo extends StatefulWidget {
  var msg;
  MsgVideo(this.msg);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(this.msg);
}

class _VideoPlayerScreenState extends State<MsgVideo> {
  var msg;
  _VideoPlayerScreenState(this.msg);

  var isReady = false;
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  void play() {
    _controller = VideoPlayerController.network(
      'https://filesamples.com/samples/video/mp4/sample_640x360.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();

    _initializeVideoPlayerFuture.then((value) {
      print("加载完成");
      this.setState(() {
        isReady = true;
      });
      this._controller.play();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Complete the code in the next step.
    return GestureDetector(
      onTap: () => {this.play()},
      child: Container(
        child: isReady
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              )
            : Container(
                child: Text("获取视频封面..."),
              ),
      ),
    );
  }
}
