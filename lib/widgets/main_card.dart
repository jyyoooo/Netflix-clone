import 'package:flutter/material.dart';
import 'package:netflix/core/constants.dart';

class MainCard extends StatelessWidget {
  // final String imageUrlFromApi;

  const MainCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
          image: const DecorationImage(
              image: NetworkImage(
                  'https://images.pexels.com/photos/19534459/pexels-photo-19534459/free-photo-of-aerial-view-of-a-river-winding-through-a-green-wetland.jpeg'),
              fit: BoxFit.cover),
          borderRadius: kRadius10),
    );
  }
}
