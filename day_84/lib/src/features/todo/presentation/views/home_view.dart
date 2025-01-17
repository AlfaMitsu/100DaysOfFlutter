import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_animated_icons/lottiefiles.dart';
import 'package:flutter_animated_icons/useanimations.dart';
import 'package:lottie/lottie.dart';

class HomeView extends StatefulWidget {
  final String title;
  const HomeView({super.key, required this.title});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController _settingController;
  late AnimationController _favoriteController;
  late AnimationController _menuController;
  late AnimationController _bellController;
  late AnimationController _bookController;

  @override
  void initState() {
    super.initState();

    _settingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _favoriteController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _menuController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _bellController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _bookController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _settingController.dispose();
    _favoriteController.dispose();
    _menuController.dispose();
    _bellController.dispose();
    _bookController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Tap'),
                  ),
                  IconButton(
                    splashRadius: 50,
                    iconSize: 100,
                    onPressed: () {
                      _settingController.reset();
                      _settingController.forward();
                    },
                    icon: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Lottie.asset(Icons8.adjust,
                          controller: _settingController),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Toggle'),
                  ),
                  IconButton(
                    splashRadius: 50,
                    iconSize: 100,
                    onPressed: () {
                      if (_favoriteController.status ==
                          AnimationStatus.dismissed) {
                        _favoriteController.reset();
                        _favoriteController.animateTo(0.6);
                      } else {
                        _favoriteController.reverse();
                      }
                    },
                    icon: Lottie.asset(Icons8.heart_color,
                        controller: _favoriteController),
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Hover'),
                  ),
                  MouseRegion(
                    onEnter: (event) {
                      _bookController.repeat();
                    },
                    onExit: (event) {
                      _bookController.stop();
                    },
                    child: IconButton(
                      splashRadius: 50,
                      iconSize: 100,
                      onPressed: () {
                        if (_bookController.status ==
                            AnimationStatus.dismissed) {
                          _bookController.reset();
                          _bookController.animateTo(1);
                        } else {
                          _bookController.reverse();
                        }
                      },
                      icon: Lottie.asset(Icons8.book,
                          controller: _bookController,
                          height: 60,
                          fit: BoxFit.fitHeight),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text('Repeat'),
                  ),
                  IconButton(
                    splashRadius: 50,
                    iconSize: 100,
                    onPressed: () {
                      if (kDebugMode) {
                        print(_bellController.status);
                      }
                      if (_bellController.isAnimating) {
                        _bellController.reset();
                      } else {
                        _bellController.repeat();
                      }
                    },
                    icon: Lottie.asset(LottieFiles.$63128_bell_icon,
                        controller: _bellController,
                        height: 60,
                        fit: BoxFit.cover),
                  ),
                ],
              ),
              Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Edited animation color\nblack → blue',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        splashRadius: 50,
                        iconSize: 100,
                        onPressed: () {
                          if (_menuController.status ==
                              AnimationStatus.dismissed) {
                            _menuController.reset();
                            _menuController.animateTo(0.6);
                          } else {
                            _menuController.reverse();
                          }
                        },
                        icon: Lottie.asset(
                          Useanimations.menuV3,
                          controller: _menuController,
                          height: 60,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      IconButton(
                        splashRadius: 50,
                        iconSize: 100,
                        onPressed: () {
                          if (_menuController.status ==
                              AnimationStatus.dismissed) {
                            _menuController.reset();
                            _menuController.animateTo(0.6);
                          } else {
                            _menuController.reverse();
                          }
                        },
                        icon: Lottie.asset(
                          Useanimations.menuV3Blue,
                          controller: _menuController,
                          height: 60,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
