import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constant.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leftwidget;
  //final String title;
  const CustomAppBar({super.key,required this.leftwidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          leftwidget,
          const Spacer(),
          const Icon(Icons.cast, size: 32),
          kWidth,
          const SizedBox.square(dimension: 6.5),
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset("assets/avatar.png"),
          ),
          kWidth,
        ],
      ),
    );
  }
}
