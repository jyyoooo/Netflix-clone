import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';
import 'package:netflix/widgets/custom_button.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
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
            padding:  EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:  [
                CustomButtonWidget(
                  title: "My List",
                  icon: Icons.add,
                ),
                // PlayButton(),
                CustomButtonWidget(icon: Icons.info_outline, title: 'Info')
              ],
            ),
          ),
        )
      ],
    );
  }
}
