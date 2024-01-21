import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/view/widgets/customappbar.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';
import '../../core/constants/constant.dart';
import '../widgets/backgroundcard.dart';
import '../widgets/maintitlecard.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;
                  log('$direction');
                  if (notification.depth == 0 &&
                      direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (notification.depth == 0 &&
                      direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return false;
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ListView(
                        physics: const BouncingScrollPhysics(),
                        children: [
                          BackgroundCard(),
                          kHeight,
                          MainTitleMovieCard(
                            title: "New Releases",
                            apiService: APIService().getNewReleases(),
                          ),
                          kHeight,
                          MainTitleMovieCard(
                            title: "Trending Now",
                            apiService: APIService().getTrendingMovies(),
                          ),
                          kHeight,
                          const NumberTitleMovieCard(),
                          kHeight,
                          MainTitleMovieCard(
                            title: "Popular Shows",
                            apiService: APIService().getPopularShows(),
                          ),
                          kHeight,
                          MainTitleMovieCard(
                            title: "Upcoming",
                            apiService: APIService().getUpcomingMovies(),
                          ),
                          kHeight,
                        ],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                  CustomAppBar(
                                    leftwidget: Image.network(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0c/Netflix_2015_N_logo.svg/640px-Netflix_2015_N_logo.svg.png',
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("TV Shows", style: kHomeTitleText),
                                      Text(
                                        "Movies",
                                        style: kHomeTitleText,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Categories",
                                            style: kHomeTitleText,
                                          ),
                                          const Icon(Icons.arrow_drop_down)
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          : kHeight,
                    ],
                  ),
                ),
              );
            }));
  }
}
