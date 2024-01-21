import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/controller/api_key.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/model/movie_model.dart';
import '../../../core/constants/constant.dart';
import '../../widgets/custombutton.dart';
import '../../widgets/videowidget.dart';

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    String imageUrl = '$baseImageURL${movie.posterPath}?api_key=$apiKey';

    return Padding(
      padding: const EdgeInsets.fromLTRB(10,20,10,10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  fetchDate(movie.releaseDate!),
                  style: const TextStyle(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(videoImage: imageUrl),
                kHeight,
                const Row(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        CustomButtonWidget(color: Colors.blue,
                          icon: CupertinoIcons.alarm,
                          title: 'Remind me',
                          iconSize: 22,
                          textSize: 11,
                        ),
                        kWidth,
                        CustomButtonWidget(color: Colors.blue,
                          icon: CupertinoIcons.info,
                          title: 'Info',
                          iconSize: 22,
                          textSize: 11,
                        ),
                        kWidth,
                      ],
                    )
                  ],
                ),
                kHeight,
                Text("Coming on ${fetchDay(movie.releaseDate!)}"),
                kHeight,
                Text(
                  movie.originalTitle ?? 'Empty Title',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                kHeight,
                Text(
                  movie.overview!,
                  style: const TextStyle(color: kGreyColor),
                ),
                kHeight20
              ],
            ),
          ),
        ],
      ),
    );
  }

  String fetchDate(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final formatDate = (DateFormat.MMMMd().format(dateInFormat)).split(" ");

    return "${formatDate.first.substring(0, 3)} \n${formatDate.last} ";
  }

  String fetchDay(String date) {
    DateTime dateInFormat = DateTime.parse(date);
    final dayName = DateFormat('EEEE').format(dateInFormat);
    return dayName;
  }
}
