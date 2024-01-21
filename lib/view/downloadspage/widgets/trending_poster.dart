import 'package:flutter/material.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/model/movie_model.dart';
import '../../../core/constants/constant.dart';
import 'downloadsimage.dart';

class IntroDownloads extends StatefulWidget {
  const IntroDownloads({
    super.key,
  });

  @override
  State<IntroDownloads> createState() => _IntroDownloadsState();
}

class _IntroDownloadsState extends State<IntroDownloads> {
  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    super.initState();
    trendingMovies = APIService().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kWhiteColor, fontSize: 22, fontWeight: FontWeight.bold),
        ),
        kHeight,
        const Text(
          "We will download a personalized selection of \nmovies and shows for you, so there's\n always something to watch on your\n device.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        FutureBuilder(
            future: trendingMovies,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasError) {
                return const Text('Something went wrong');
              } else if (snapshot.hasData) {
                return Container(
                  margin: EdgeInsets.zero,
                  width: size.width,
                  height: size.width * 0.95,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.withOpacity(0.3),
                        radius: size.width * 0.38,
                      ),
                      DownloadsImageWidget(
                        image: '$baseImageURL${snapshot.data[0].posterPath}',
                        margin: const EdgeInsets.only(
                          left: 170,
                          top: 50,
                        ),
                        angle: 25,
                        size: Size(size.width * 0.32, size.width * 0.52),
                      ),
                      DownloadsImageWidget(
                        image: '$baseImageURL${snapshot.data[1].posterPath}',
                        margin: const EdgeInsets.only(right: 170, top: 50),
                        angle: -20,
                        size: Size(size.width * 0.32, size.width * 0.52),
                      ),
                      DownloadsImageWidget(
                        image: '$baseImageURL${snapshot.data[2].posterPath}',
                        margin: const EdgeInsets.only(bottom: 35, top: 50),
                        size: Size(size.width * 0.37, size.width * 0.57),
                      ),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                );
              }
            }),
      ],
    );
  }
}
