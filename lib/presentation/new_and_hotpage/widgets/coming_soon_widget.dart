import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coming_soon_info_card.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) =>
            const ComingSoonInfoCard());
  }
}
