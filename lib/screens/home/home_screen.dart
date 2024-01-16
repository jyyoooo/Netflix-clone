import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/constants.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotifier,
            builder: (context, index, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: ((notification) {
                  final ScrollDirection direction = notification.direction;
                  if (direction == ScrollDirection.reverse) {
                    scrollNotifier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotifier.value = true;
                  }
                  return true;
                }),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      ListView(physics: const BouncingScrollPhysics(),
                        children: const [],
                      ),
                      scrollNotifier.value == true
                          ? AnimatedContainer(
                              duration: const Duration(milliseconds: 1000),
                              width: double.infinity,
                              height: 90,
                              color: Colors.black.withOpacity(0.3),
                              child: Column(
                                children: [
                                
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
