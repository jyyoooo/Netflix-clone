import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/view/widgets/maintitlecard.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';
import 'package:netflix/view/widgets/playbutton.dart';
import '../../core/constants/constant.dart';
import 'custombutton.dart';

class BackgroundCard extends StatelessWidget {
  BackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder(
          future: APIService().getTopTenTVShows(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SizedBox(
                width: double.infinity,
                height: 500,
                child: Center(child: SomethingWentWrongWidget()),
              );
            } else if (snapshot.hasData) {
              String image =
                  snapshot.data!.map((e) => e.posterPath).first.toString();
              print('main bg image $image');
              return Container(
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('$baseImageURL$image'),
                  ),
                ),
              );
            } else {
              return const SizedBox(
                width: double.infinity,
                height: 500,
                child: LoadingPleaseWait(),
              );
            }
          },
          // Container(
          //   width: double.infinity,
          //   height: 500,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       fit: BoxFit.cover,
          //       image: NetworkImage(imageUrl ?? kMainImage),
          //     ),
          //   ),
          // ),
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
                    title: '',
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
