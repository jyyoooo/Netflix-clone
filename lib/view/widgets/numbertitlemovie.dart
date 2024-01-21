import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/view/widgets/maintitlecard.dart';
import 'package:netflix/view/widgets/title_widget.dart';
import '../../core/constants/constant.dart';
import 'numbercard.dart';

class NumberTitleMovieCard extends StatelessWidget {
  const NumberTitleMovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: TitleTextWidget(
            title: 'Top Rated TV Shows',
          ),
        ),
        kHeight,
        FutureBuilder(
            future: APIService().getTopTenTVShows(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: SomethingWentWrongWidget(),
                );
              } else if (snapshot.hasData) {
                imageList =
                    snapshot.data?.map((show) => show.posterPath).toList();
                log("top images list $imageList");
                return LimitedBox(
                  maxHeight: 200,
                  child: ListView(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      10,
                      (index) =>
                          NumberCard(index: index, imageUrl: imageList[index]),
                    ),
                  ),
                );
              } else {
                return const LoadingPleaseWait();
              }
            }),
      ],
    );
  }
}

class LoadingPleaseWait extends StatelessWidget {
  const LoadingPleaseWait({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [CircularProgressIndicator.adaptive(), Text('Please wait')],
      ),
    );
  }
}
