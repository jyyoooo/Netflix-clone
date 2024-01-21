import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constant.dart';

class CustomAppBar extends StatelessWidget {
  final Widget leftwidget;
  //final String title;
  const CustomAppBar({super.key, required this.leftwidget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10,15,10,0),
      child: Row(
        children: [
          leftwidget,
          const Spacer(),
          const Icon(Icons.cast, size: 30),
          kWidth,
          kWidth,
          SizedBox(
            height: 30,
            width: 30,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset("assets/avatar.png")),
          ),
          kWidth,
        ],
      ),
    );
  }
}
