import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'dart:math' as math;

import 'example_app_bar.dart';

class ProgrammaticRotationExample extends StatefulWidget {
  const ProgrammaticRotationExample({super.key});

  @override
  State<ProgrammaticRotationExample> createState() =>
      _ProgrammaticRotationExampleState();
}

class _ProgrammaticRotationExampleState
    extends State<ProgrammaticRotationExample> {
  final PhotoViewController _controller = PhotoViewController();
  var _quarterTurns = 0;

  void _rotateRight90Degrees() {
    // Set the rotation to either 0, 90, 180 or 270 degrees (value is in radians)
    _quarterTurns = _quarterTurns == 3 ? 0 : _quarterTurns + 1;
    _controller.rotation = math.pi / 2 * _quarterTurns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const ExampleAppBar(
            title: "Programmatic Rotation Example",
            showGoBack: true,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text(
                    "Example without manual rotation, click the button to rotate",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 20.0),
                    height: 300.0,
                    child: ClipRect(
                      child: PhotoView(
                        controller: _controller,
                        imageProvider:
                            const AssetImage("assets/large-image.jpg"),
                        maxScale: PhotoViewComputedScale.covered,
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                        enableRotation: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _rotateRight90Degrees,
        child: const Icon(Icons.rotate_right),
      ),
    );
  }
}
