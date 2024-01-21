import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

ValueNotifier<int> indexNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: indexNotifier,
        builder: ((context, value, _) {
          return BottomNavigationBar(
              currentIndex: value,
              onTap: (value) {
                indexNotifier.value = value;
              },
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle:
                  TextStyle(fontFamily: GoogleFonts.ptSans().fontFamily),
              unselectedLabelStyle:
                  TextStyle(fontFamily: GoogleFonts.ptSans().fontFamily),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.house_alt),
                    label: "Home",
                    activeIcon: Icon(CupertinoIcons.house_alt_fill)),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.news),
                    label: "New & Hot",
                    activeIcon: Icon(CupertinoIcons.news_solid)),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.smiley),
                    activeIcon: Icon(CupertinoIcons.smiley_fill),
                    label: "Fast Laughs"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search_circle),
                    activeIcon: Icon(CupertinoIcons.search_circle_fill),
                    label: "Search"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.arrow_down_to_line),
                    activeIcon: Icon(CupertinoIcons.arrow_down_to_line_alt),
                    label: "Downloads"),
              ]);
        }));
  }
}
