import 'package:flutter/material.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/view/new_and_hotpage/coming_soon_page.dart';
import 'package:netflix/view/new_and_hotpage/everyones_watching_page.dart';
import '../../core/constants/constant.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: AppBar(
                  leading: const SizedBox.shrink(),
                  title: const Text(
                    "New & Hot",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  actions: [
                    const Icon(
                      Icons.cast,
                      color: Colors.white,
                      size: 30,
                    ),
                    const SizedBox(width: 18),
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.asset("assets/avatar.png")),
                    ),
                    kWidth,
                  ],
                  bottom: TabBar(
                      enableFeedback: true,
                      unselectedLabelColor: kWhiteColor,
                      labelColor: Colors.black,
                      dividerColor: Colors.transparent,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorPadding: const EdgeInsets.all(5),
                      isScrollable: true,
                      labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                      indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: kRadius30,
                      ),
                      tabs: const [
                        Tab(
                          text: "Coming Soon",
                        ),
                        Tab(
                          text: "Everyone's watching",
                        )
                      ]),
                ),
              )),
          body: TabBarView(physics: const BouncingScrollPhysics(), children: [
            buildComingSoon(),
            buildEveryonesWatching(),
          ]),
        ),
      ),
    );
  }

  Widget buildComingSoon() {
    return const ComingSoonWidget();
  }

  buildEveryonesWatching() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight20,
        Expanded(child: EveryonesWatchingWidget()),
      ],
    );
  }
}
