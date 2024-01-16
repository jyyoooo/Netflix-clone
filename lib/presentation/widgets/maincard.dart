import 'package:flutter/material.dart';
import 'package:netflix/core/constants/constant.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/13919952/pexels-photo-13919952.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
              fit: BoxFit.cover),
          borderRadius: kRadius10),
    );
  }
}
