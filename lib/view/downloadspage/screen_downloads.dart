import 'package:flutter/material.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/view/downloadspage/widgets/setupsection.dart';
import 'package:netflix/view/downloadspage/widgets/trending_poster.dart';
import 'package:netflix/view/widgets/customappbar.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final widgetList = [
    const SmartDownloadSection(),
    const IntroDownloads(),
    const SetupSection(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(60),
            child: CustomAppBar(
              leftwidget: Text(
                "Downloads",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
            )),
        body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(10),
          itemBuilder: (ctx, index) => widgetList[index],
          separatorBuilder: (ctx, index) => const SizedBox(
            height: 25,
          ),
          itemCount: widgetList.length,
        ));
  }
}

class SmartDownloadSection extends StatelessWidget {
  const SmartDownloadSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        kWidth,
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ],
    );
  }
}
