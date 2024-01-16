import 'package:flutter/material.dart';
import 'package:netflix/presentation/new_and_hotpage/widgets/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hotpage/widgets/everyones_watching_widget.dart';

import '../../core/colors/colors.dart';
import '../../core/constants/constant.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(95),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 30,
                ),
                kWidth,
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset("assets/avatar.png"),
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
            )),
        body: TabBarView(physics: const BouncingScrollPhysics(), children: [
          buildComingSoon(),
          buildEveryonesWatching(),
        ]),
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
        Text(
          "Everyone's watching",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Expanded(child: EveryonesWatchingWidget()),
      ],
    );
  }
}
