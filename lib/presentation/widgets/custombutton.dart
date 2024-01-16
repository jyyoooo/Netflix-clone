import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    super.key,
    required this.icon,
    required this.title,
    this.iconSize=30,
    this.textSize = 18,
    this.color = Colors.white
  });

  final Color color;
  final IconData icon;
  final String title;
  final double iconSize;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Column(
        children: [
          Icon(icon,
          color: color,
          size: iconSize,),
          Text(title,
          style: TextStyle(
            fontSize: textSize,
          ),
          ),
        ],
      ),
    );
  }
}