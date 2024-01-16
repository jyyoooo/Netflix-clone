import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

import '../../core/constants/constant.dart';
import 'maincard.dart';

class MainTitleMovieCard extends StatelessWidget {
  final String title;
  final String apiUrl;
  const MainTitleMovieCard(
      {super.key, required this.title, required this.apiUrl});

  @override
  Widget build(BuildContext context) {
    // List imageList = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(title: title),
        kHeight,
        SizedBox(
          height: 225,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            //padding: EdgeInsets.all(15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => const MainCard(),
            itemCount: 10,
            separatorBuilder: (context, index) => kWidth,
          ),
        )
      ],
    );
  }
}
