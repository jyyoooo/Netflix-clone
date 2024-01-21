import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/constants/colors.dart';
import 'package:netflix/view/fastlaugh_page/widget/fastlaughvideoplayer.dart';

final videos = [
  "https://player.vimeo.com/progressive_redirect/playback/885780991/rendition/540p/file.mp4?loc=external&oauth2_token_id=1747418641&signature=3e125d94eec40e7c7f73b78b08f0d59b32e41f43e47b7b40e8f26963a02a5b9a",
  'https://player.vimeo.com/progressive_redirect/playback/798598304/rendition/540p/file.mp4?loc=external&oauth2_token_id=57447761&signature=b973cf497fb3ad3c2675d91bbea26fc6a132fd2ef91c9000d6f874f8e8a148b8',
  'https://player.vimeo.com/external/475538250.sd.mp4?s=6c34a7599f0c7d335cddacb9a98c6ce1f518c262&profile_id=165&oauth2_token_id=57447761',
  'https://player.vimeo.com/progressive_redirect/playback/881087186/rendition/540p/file.mp4?loc=external&oauth2_token_id=1747418641&signature=eede226fbc88625cab5eb8f0f090a0290f358d4b9896ee9ef7357d57b03551e3',
  'https://player.vimeo.com/progressive_redirect/playback/795027180/rendition/540p/file.mp4?loc=external&oauth2_token_id=57447761&signature=01a766fbc60f8a6ec26fba62364c97dd32901232d305dc1884eebc6a62e47d5b'
];

class VideoListItemWidget extends StatefulWidget {
  final int index;
  const VideoListItemWidget({super.key, required this.index});

  @override
  State<VideoListItemWidget> createState() => _VideoListItemWidgetState();
}

class _VideoListItemWidgetState extends State<VideoListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final videoUrl = videos[widget.index % videos.length];
    return Stack(children: [
      FastLaughVideoPlayer(videoUrl: videoUrl, onStateChanged: (boolean) {}),
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
                    size: 25,
                  )),

               Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(vertical: 10),
                    child: CircleAvatar(
                      radius: 25,backgroundColor: Colors.grey.withOpacity(.8),
                    ),
                  ),
                 const VideoActionWidget(icon: CupertinoIcons.heart, title: "Like"),
                 const VideoActionWidget(icon: CupertinoIcons.smiley, title: "LOL"),
                 const VideoActionWidget(icon: CupertinoIcons.add, title: "My List"),
                 const VideoActionWidget(icon: CupertinoIcons.share, title: "Share"),
                ],
              )
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
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 11),
          )
        ],
      ),
    );
  }
}
