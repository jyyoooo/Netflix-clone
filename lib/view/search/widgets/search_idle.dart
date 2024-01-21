import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/view/search/widgets/titlewidget.dart';
import 'package:netflix/view/widgets/maintitlecard.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w1066_and_h600_bestv2/q7vmCCmyiHnuKGMzHZlr0fD44b9.jpg';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: 'Top Searches'),
        kHeight,
        FutureBuilder(
          future: APIService().getTrendingMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SomethingWentWrongWidget();
            }
            if (snapshot.hasData) {
              return Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        TopSearchItemTile(movie: snapshot.data![index]),
                    separatorBuilder: (context, index) => Divider(
                          thickness: .1,
                          color: Colors.grey.withOpacity(.9),
                          height: 30,
                        ),
                    itemCount: 10),
              );
            }
            return const LoadingPleaseWait();
          },
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        SizedBox(
          width: screenWidth * .33,
          height: 60,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Image.network(
                  '$baseImageURL${movie.posterPath}' ?? imageUrl,
                  fit: BoxFit.fitWidth)),
        ),
        kWidth,
        Expanded(
            child: Text(
          '${movie.title}',
          style: const TextStyle(fontSize: 16),
        )),
        IconButton(
            onPressed: () {}, icon: const Icon(CupertinoIcons.play_circle))
      ],
    );
  }
}
