import 'package:flutter/material.dart';
import 'package:netflix/view/fastlaugh_page/widget/videolistitem.dart';

class ScreenFastLaugh extends StatelessWidget {
  const ScreenFastLaugh({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(5, (index) {
            return VideoListItemWidget(index: index);
          })),
    ));
  }
}
