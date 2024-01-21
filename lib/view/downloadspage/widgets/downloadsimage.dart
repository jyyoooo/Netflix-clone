import 'dart:math';

import 'package:flutter/material.dart';

class DownloadsImageWidget extends StatelessWidget {
  final EdgeInsets margin;
  final double angle;
  final double bradius;
  final Size size;
  final String image;

  const DownloadsImageWidget({
    super.key,
    required this.margin,
    this.angle = 0,
    this.bradius = 10,
    required this.size,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(bradius),
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(bradius),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(image),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
