import 'package:flutter/material.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import 'home_view.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.1),
              Stack(
                children: [
                  Container(
                    height: size.height * 0.4,
                    width: size.width,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.2,
                        color: Colors.black12.withOpacity(0.05),
                      ),
                      borderRadius: BorderRadius.circular(200),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 36,
                    child: Container(
                      height: size.height * 0.31,
                      width: size.width * 0.67,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.2,
                          color: Colors.black12.withOpacity(0.09),
                        ),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 75,
                    left: 70,
                    child: Container(
                      height: size.height * 0.23,
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.2,
                          color: Colors.black12,
                        ),
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 110,
                    child: SizedBox(
                      height: size.height * 0.14,
                      width: size.width * 0.3,
                      child: Column(
                        children: [
                          Image.asset(kImgCloud),
                          Text(
                            'CHAT APP',
                            style: kTitleTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Text(
                  'A new way to connect\nwith your friends',
                  textAlign: TextAlign.center,
                  style: kDescriptionTextStyle,
                ),
              ),
              SizedBox(height: size.height * 0.07),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeView(),
                    ),
                  );
                },
                child: Container(
                  height: 65,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: kPrimaryColor,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(
                      right: 5,
                      left: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Get Started',
                          textAlign: TextAlign.center,
                          style: kGetStartedTextStyle,
                        ),
                        CircleAvatar(
                          radius: 25,
                          backgroundColor: kWhiteColor,
                          child: Icon(Icons.arrow_forward),
                        ),
                      ],
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
