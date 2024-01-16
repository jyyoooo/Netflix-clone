import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/widgets/playbutton.dart';

import '../../core/constants/constant.dart';
import 'custombutton.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  initState() {
    super.initState();
    // setImage();
  }

  // setImage() async {
  //   dynamic result = await apicall(ApiEndPoints.moviepopular);

  //   setState(() {
  //     if (result.results.isNotEmpty) {
  //       MovieInfoModel movieInfo = result.results[3];
  //       imageUrl =
  //           "https://image.tmdb.org/t/p/w500${movieInfo.posterPath}?api_key=b2dee3b855c4ea705ff5dda3c0201768";
  //     }
  //   });
  // }

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl ?? kMainImage),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.black.withOpacity(0.85),
            Colors.black.withOpacity(0),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(
                    textSize: 15,
                    title: "",
                    icon: CupertinoIcons.add,
                    iconSize: 29),
                PlayButton(),
                CustomButtonWidget(
                    textSize: 15,
                    icon: CupertinoIcons.info,
                    title: '',
                    iconSize: 25)
              ],
            ),
          ),
        )
      ],
    );
  }
}
