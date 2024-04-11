import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/dimensions.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/chart_data.dart';
import '../../data/models/main_side_favorite_league_model.dart';
import '../../data/models/main_side_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: kWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: kGrey300Color,
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: defaultPadding * 2),
                      SizedBox(
                        height: 90,
                        width: 90,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 90,
                                width: 90,
                                child: SfCircularChart(
                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                      dataSource: chartData,
                                      innerRadius: '95%',
                                      radius: '100%',
                                      startAngle: 90,
                                      endAngle: 0,
                                      pointColorMapper: (ChartData data, _) =>
                                          data.color,
                                      xValueMapper: (ChartData data, _) =>
                                          data.level,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                height: 60,
                                child: ClipOval(
                                  child: Image.asset(
                                    kImgProfile,
                                    scale: 2.5,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  height: 8,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: kSecondaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Al-Fasheer Hadji Usop',
                        style: kHomeViewUserNameTextStyle,
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              'Professional .',
                              style: kHomeViewLevelStatusTextStyle,
                            ),
                          ),
                          Text(
                            '3rd Level',
                            style: kHomeViewLevelTextStyle,
                          ),
                        ],
                      ),
                      const SizedBox(height: defaultPadding),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '1,102,023',
                                  style: kHomeViewLevelStatusTextStyle,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: kHomeViewFollowersTextStyle,
                              ),
                            ],
                          ),
                          const SizedBox(width: defaultPadding * 2),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '1,102,023',
                                  style: kHomeViewLevelStatusTextStyle,
                                ),
                              ),
                              Text(
                                'Followers',
                                style: kHomeViewFollowersTextStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: mainSide.length,
                      itemBuilder: (context, index) {
                        return dashboardListTile(
                          index,
                          mainSide[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Favorite League',
                        style: kHomeViewFavoriteTextStyle,
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      Container(
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: kSecondaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: kWhiteColor,
                            size: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return FavoriteListTile(
                          index,
                          mainSideFavoriteLeague[index],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container FavoriteListTile(
      int index, MainSideFavoriteLeagueModel mainSideFavoriteLeague) {
    return Container(
      color: index != null && _selectedIndex == index + 4
          ? kBgColor
          : kTransparent,
      child: ListTile(
        hoverColor: kHoverColor,
        onTap: () {
          setState(() {
            _selectedIndex = mainSideFavoriteLeague.index;
          });
        },
        leading: Padding(
          padding: const EdgeInsets.only(left: defaultPadding * 1.5),
          child: SizedBox(
            height: 30,
            width: 30,
            child: ClipOval(
              child: Image.asset(mainSideFavoriteLeague.image),
            ),
          ),
        ),
        title: Text(
          mainSideFavoriteLeague.title,
          style: kHomeViewTitleTextStyle,
        ),
      ),
    );
  }

  Container dashboardListTile(int index, MainSideModel mainSide) {
    return Container(
      color: index != null && _selectedIndex == index ? kBgColor : kTransparent,
      child: ListTile(
        hoverColor: kHoverColor,
        onTap: () {
          setState(() {
            _selectedIndex = mainSide.index;
          });
        },
        leading: const Icon(
          Icons.dashboard,
          color: kSecondaryColor,
        ),
        title: Text(
          'Dashboard',
          style: kHomeViewTitleTextStyle,
        ),
      ),
    );
  }
}
