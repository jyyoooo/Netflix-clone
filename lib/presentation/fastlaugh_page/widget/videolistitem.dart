import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

import 'package:netflix/presentation/fastlaugh_page/widget/fastlaughvideoplayer.dart';

// final dummyVideoUrls = [
//   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
//   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
//   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
//   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
//   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
// ];

class VideoListItemWidget extends StatefulWidget {
  final int index;
  const VideoListItemWidget({super.key, required this.index});

  @override
  State<VideoListItemWidget> createState() => _VideoListItemWidgetState();
}

class _VideoListItemWidgetState extends State<VideoListItemWidget> {
  List imageList = [];
  // trendingDataFetch() async {
  //   dynamic result = await apicall(ApiEndPoints.trendingall);
  //   setState(() {
  //     imageList = result.results.map((MovieInfoModel result) {
  //       String imageUrl =
  //           "https://image.tmdb.org/t/p/w500/${result.posterPath}?api_key=$apiKey";
  //       return imageUrl;
  //     }).toList();
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // trendingDataFetch();
  }

  @override
  Widget build(BuildContext context) {
    final videoUrl = '';
    return Stack(children: [
      FastLaughVideoPlayer(
          videoUrl: videoUrl ?? '', onStateChanged: (boolean) {}),
      Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //leftside
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.volume_off,
                    size: 30,
                  )),

              //right side
              if (imageList.isNotEmpty) ...[
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundImage: NetworkImage(
                          imageList[widget.index],
                        ),
                      ),
                    ),
                    const VideoActionWidget(
                        icon: CupertinoIcons.smiley, title: "LOL"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.add, title: "My List"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.share, title: "Share"),
                    const VideoActionWidget(
                        icon: CupertinoIcons.play_arrow, title: "Play"),
                  ],
                )
              ]
            ],
          ),
        ),
      )
    ]);
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: kWhiteColor,
            size: 28,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 12),
          )
        ],
      ),
    );
  }
}
