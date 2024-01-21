import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants/colors.dart';

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: TextButton.icon(
          onPressed: () {},
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
                const EdgeInsets.fromLTRB(15, 8, 15, 8)),
            backgroundColor: MaterialStateProperty.all(kWhiteColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            )),
          ),
          icon: const Icon(
            CupertinoIcons.play_fill,
            size: 28,
            color: kBlackColor,
          ),
          label: const Padding(
            padding: EdgeInsets.only(right: 7.5, left: 5),
            child: Text(
              "Play",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: kBlackColor,
              ),
            ),
          )),
    );
  }
}
