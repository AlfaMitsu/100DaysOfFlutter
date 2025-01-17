import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import 'dash_board_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: defaultPadding * 7,
            bottom: defaultPadding * 5,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sell Crypto',
                    style: kHomeViewHeadingTextStyle,
                  ),
                  Stack(
                    children: [
                      Text(
                        'and Spend',
                        style: kHomeViewSubHeadingOuterTextStyle,
                      ),
                      const Text(
                        'and spend',
                        style: kHomeViewSubHeadingInnerTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Stack(
                children: [
                  Container(
                    height: 450,
                    width: 300,
                    margin: const EdgeInsets.only(top: 30),
                    transform: Matrix4.rotationZ(-0.1),
                    transformAlignment: Alignment.bottomLeft,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(defaultBorderRadius),
                      ),
                      color: kRedColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 22, bottom: 5),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(defaultPadding),
                        ),
                        child: Image.asset(kImgCard2),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(defaultBorderRadius),
                    ),
                    child: Container(
                      height: 480,
                      width: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(defaultBorderRadius),
                        ),
                        shape: BoxShape.rectangle,
                        color: kLightGreenColor,
                      ),
                      child: Stack(
                        children: [
                          Image.asset(kImgCard1),
                          Container(
                            padding: const EdgeInsets.only(
                              top: defaultPadding * 3,
                              left: defaultPadding * 2,
                              right: defaultPadding * 2,
                              bottom: defaultPadding,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    for (var i = 0; i < 4; i++)
                                      Container(
                                        margin: const EdgeInsets.only(right: 5),
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: kBlackColor,
                                        ),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: defaultPadding),
                                      child: Text(
                                        '1004',
                                        style: kCardNumberTextStyle,
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      kImgChip,
                                      scale: 10,
                                      color: kGreyColor,
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Al-Fasheer\nHadji Usop',
                                  style: kCardNameTextStyle,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: SvgPicture.asset(
                                    kIcVisa,
                                    height: 70,
                                    colorFilter: const ColorFilter.mode(
                                      kWhiteColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 4),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2.5),
                child: Text(
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  'Instantly get cash for Crypto, Spend it to your bank account, or spend online and in-store with your BEta visa Debit Card',
                  style: kAppDetailsTextStyle,
                ),
              ),
              const SizedBox(height: 100),
              InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(defaultBorderRadius * 4),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DashBoardView(),
                    ),
                  );
                },
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(40),
                    ),
                    gradient: kLineGradientColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Text(
                          'Get Started',
                          style: kGetStartedTextStyle,
                        ),
                      ),
                      const Icon(Icons.arrow_forward),
                      const Spacer(),
                    ],
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
