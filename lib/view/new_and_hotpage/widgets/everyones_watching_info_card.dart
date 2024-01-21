import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/model/movie_model.dart';
import '../../../core/constants/constant.dart';
import '../../widgets/custombutton.dart';
import '../../widgets/videowidget.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE,
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.withOpacity(.3),
            ),
            height: 200,
            child:movie.backDropPath!.isEmpty?const Center(child: Text('Image not found'),):
                VideoWidget(videoImage: '$baseImageURL${movie.backDropPath}'),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWidget(
                  icon: CupertinoIcons.share,
                  title: 'Share',
                  iconSize: 22,
                  textSize: 11,
                  color: Colors.blue,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: CupertinoIcons.add,
                  title: 'My List',
                  iconSize: 22,
                  textSize: 11,
                  color: Colors.blue,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: CupertinoIcons.play_arrow,
                  title: "Play",
                  iconSize: 22,
                  textSize: 11,
                  color: Colors.blue,
                ),
                kWidth,
              ],
            ),
          ),
          kHeight,
          Text(
            '${movie.originalTitle}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          Text(
            '${movie.overview}',
            style:const TextStyle(color: kGreyColor),
          ),
        ],
      ),
    );
  }
}
