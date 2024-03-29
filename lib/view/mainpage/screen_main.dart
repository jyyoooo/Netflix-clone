import 'package:flutter/material.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/view/downloadspage/screen_downloads.dart';
import 'package:netflix/view/fastlaugh_page/screen_fastlaugh.dart';
import 'package:netflix/view/home/screen_home.dart';
import 'package:netflix/view/search/screen_search.dart';
import '../new_and_hotpage/screen_newandhot.dart';
import '../widgets/main/bottom_nav.dart';

class ScreenMain extends StatelessWidget {
   ScreenMain({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
     ScreenDownload()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolor,
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: indexNotifier,
          builder: (BuildContext context, dynamic index, Widget? _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
