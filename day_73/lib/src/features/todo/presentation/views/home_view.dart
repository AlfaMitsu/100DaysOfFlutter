import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../widgets/product_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<String> category = [
    'Controllers',
    'Headsets',
    'Keyboards',
    'Speakers,',
    'VR Accessories',
  ];
  int currentSelectItems = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNaigationBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            myAppBarItems(),
            welcomeText(),
            const SizedBox(height: 5),
            categorySelection(),
            const ProductList(),
          ],
        ),
      ),
    );
  }

  SizedBox categorySelection() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: category.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.only(left: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    category[index],
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: currentSelectItems == index
                          ? kSecondaryColor
                          : kSecondTextColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Container(
                      height: 3,
                      width: 50,
                      color: currentSelectItems == index
                          ? kSecondaryColor
                          : kTransparent,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Container welcomeText() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 32,
        vertical: 10,
      ),
      child: const Text(
        'Welcome to \nPlaystation® Accessories',
        style: kWelcomeTextStyle,
      ),
    );
  }

  Padding myAppBarItems() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(kIcMenu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(kIcSearch),
          ),
        ],
      ),
    );
  }
}
