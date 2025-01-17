import 'package:day_50/src/constants/assets.dart';
import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/styles.dart';
import '../../../data/data_sources/arrays.dart';
import 'movie_details_view.dart';
import 'tv_show_details_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register(
      'change_mode',
      (value, callback) {
        if (mounted) {
          setState(() {});
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBg,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MovieDetailsView(),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        width: size.width,
                        height: size.width * 1.35,
                        child: ClipRect(
                          child: Image.asset(
                            kTModeDark ? kImgHomeImageDark : kImgHomeImageLight,
                            width: size.width,
                            height: size.width,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '4.0',
                    style: kHomeViewRatingTextStyle,
                  ),
                  IgnorePointer(
                    ignoring: true,
                    child: RatingBar(
                      initialRating: 4,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 18,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                      ratingWidget: RatingWidget(
                        full: Image.asset(kImgStarFill),
                        half: Image.asset(kImgStar),
                        empty: Image.asset(kImgStar),
                      ),
                      onRatingUpdate: (rating) {
                        if (kDebugMode) {
                          print(rating);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Movie',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                      Text(
                        ' | ',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                      Text(
                        'Adventure',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                      Text(
                        ' | ',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                      Text(
                        'Comedy',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                      Text(
                        ' | ',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                      Text(
                        'Family',
                        style: kHomeViewMovieGenreTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Watching',
                    style: kCastDetailsViewKnownForTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.46,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: watchArr.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TvShowDetailsView(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      color: kCard,
                      child: ClipRect(
                        child: Image.asset(
                          watchArr[index].toString(),
                          width: size.width * 0.33,
                          height: size.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'New & Upcoming',
                    style: kCastDetailsViewKnownForTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.46,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: watchArr.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TvShowDetailsView(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      color: kCard,
                      child: ClipRect(
                        child: Image.asset(
                          watchArr[index].toString(),
                          width: size.width * 0.33,
                          height: size.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Action',
                    style: kCastDetailsViewKnownForTextStyle,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.46,
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                scrollDirection: Axis.horizontal,
                itemCount: watchArr.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TvShowDetailsView(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 6),
                      color: kCard,
                      child: ClipRect(
                        child: Image.asset(
                          watchArr[index].toString(),
                          width: size.width * 0.33,
                          height: size.width * 0.45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
