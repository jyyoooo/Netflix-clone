import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../../widgets/custombutton.dart';

class ComingSoonInfoCard extends StatelessWidget {
  const ComingSoonInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 23, 12, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 50,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '29 Dec',
                  style: TextStyle(
                      fontSize: 18,
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(.3),),
                  height: 200,
                ),
                kHeight,
                const Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        CustomButtonWidget(
                          icon: CupertinoIcons.alarm,
                          title: 'Remind me',
                          iconSize: 20,
                          textSize: 16,
                          color: Colors.blue,
                        ),
                        kWidth,
                        CustomButtonWidget(
                          icon: CupertinoIcons.info,
                          title: 'Info',
                          iconSize: 20,
                          textSize: 16,
                          color: Colors.blue,
                        ),
                        kWidth,
                      ],
                    )
                  ],
                ),
                kHeight,
                const Text("Coming on January"),
                kHeight,
                const Text(
                  'Empty Title',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                  ),
                ),
                kHeight,
                const Text(
                  'lorem ipsum si dolor amet',
                  style: TextStyle(color: kGreyColor),
                ),
                kHeight20
              ],
            ),
          ),
        ],
      ),
    );
  }
}
