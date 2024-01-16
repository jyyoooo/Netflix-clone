import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../../widgets/custombutton.dart';

class EveryonesWatchingInfoCard extends StatelessWidget {
  const EveryonesWatchingInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // String imageUrl = '';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //IMAGE,
          Container(
            // child: VideoWidget(
            //   videoImage: imageUrl,
            // ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey.withOpacity(.3),
            ),
            height: 200,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButtonWidget(
                  icon: CupertinoIcons.share,
                  title: 'Share',
                  iconSize: 20,
                  textSize: 16,
                  color: Colors.blue,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: CupertinoIcons.add,
                  title: 'My List',
                  iconSize: 20,
                  textSize: 16,
                  color: Colors.blue,
                ),
                kWidth,
                CustomButtonWidget(
                  icon: CupertinoIcons.play_arrow,
                  title: "Play",
                  iconSize: 20,
                  textSize: 16,
                  color: Colors.blue,
                ),
                kWidth,
              ],
            ),
          ),
          kHeight,
          const Text(
            'No Title Found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          kHeight,
          const Text(
            'lorem ipsum sit doloe amet',
            style: TextStyle(color: kGreyColor),
          ),
        ],
      ),
    );
  }
}
