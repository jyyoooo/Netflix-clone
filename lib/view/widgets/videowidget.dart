import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants/colors.dart';

class VideoWidget extends StatelessWidget {
  final String? videoImage;
  const VideoWidget({
    super.key,
    this.videoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 350,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(
              '$videoImage',
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.volume_off,
              color: kWhiteColor,
              size: 22,
            ),
          ),
        )
      ],
    );
  }
}
