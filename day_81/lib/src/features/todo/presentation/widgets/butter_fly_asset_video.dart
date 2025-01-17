import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'controls_overlay.dart';

class ButterFlyAssetVideo extends StatefulWidget {
  const ButterFlyAssetVideo({super.key});

  @override
  ButterFlyAssetVideoState createState() => ButterFlyAssetVideoState();
}

class ButterFlyAssetVideoState extends State<ButterFlyAssetVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('lib/src/resources/assets/Butterfly-209.mp4');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 20),
          ),
          const Text('With assets mp4'),
          Container(
            padding: const EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  VideoPlayer(_controller),
                  ControlsOverlay(controller: _controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
