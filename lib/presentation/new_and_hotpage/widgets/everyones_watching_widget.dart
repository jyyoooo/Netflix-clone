import 'package:flutter/material.dart';
import 'everyones_watching_info_card.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) =>
            const EveryonesWatchingInfoCard());
  }
}
