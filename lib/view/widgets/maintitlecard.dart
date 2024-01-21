import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';
import 'package:netflix/view/widgets/title_widget.dart';

import '../../core/constants/constant.dart';
import 'maincard.dart';

class MainTitleMovieCard extends StatelessWidget {
  final String title;
  final dynamic apiService;
  const MainTitleMovieCard(
      {super.key, required this.title, required this.apiService});

  @override
  Widget build(BuildContext context) {
    List imageList = [];

    return FutureBuilder(
        future: apiService,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return const SizedBox(
              width: double.infinity,
              height: 200,
              child: SomethingWentWrongWidget(),
            );
          } else if (snapshot.hasData) {
            List<Movie> movies = snapshot.data;
            // print(movies);
            imageList = movies.map((movie) => movie.posterPath).toList();
            // print('images are: $imageList');

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleTextWidget(title: title),
                kHeight,
                SizedBox(
                  height: 225,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        MainCard(imageUrl: imageList[index]),
                    itemCount: 10,
                    separatorBuilder: (context, index) => kWidth,
                  ),
                )
              ],
            );
          } else {
            return const LoadingPleaseWait();
          }
        });
  }
}

class SomethingWentWrongWidget extends StatelessWidget {
  const SomethingWentWrongWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Something went wrong'));
  }
}
