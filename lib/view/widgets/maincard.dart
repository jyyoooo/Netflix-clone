import 'package:flutter/material.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/core/constants/constant.dart';

class MainCard extends StatelessWidget {
  MainCard({super.key, required this.imageUrl});
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage('$baseImageURL$imageUrl'), fit: BoxFit.cover),
          borderRadius: kRadius10),
    );
  }
}
