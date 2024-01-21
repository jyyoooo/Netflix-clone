import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/controller/api_end_points.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/core/constants/constant.dart';
import 'package:netflix/model/movie_model.dart';
import 'package:netflix/view/search/widgets/titlewidget.dart';
import 'package:netflix/view/widgets/maintitlecard.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';

String imageUrl =
    "https://media.istockphoto.com/id/1051788618/vector/movie-and-film-poster-template-design-modern-retro-vintage-style.jpg?s=612x612&w=0&k=20&c=CwMag6f5GwoHexEtMA5zrep78r4Q4yV0ZF8X0CUCIUs=";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key, required this.query});
  final String query;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchPageTitleWIdget(title: "Movies & TV"),
        kHeight,
        FutureBuilder(
          future: APIService().getSearchResults(query),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const SomethingWentWrongWidget();
            }

            if (snapshot.hasData) {
              return Expanded(
                child: GridView.count(
                    childAspectRatio: 7 / 10,
                    physics: const BouncingScrollPhysics(),
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    children: List.generate(
                        14,
                        (index) => SearchResultCard(
                            moviePoster: snapshot.data![index].posterPath))),
              );
            }
            if (snapshot.data == null) {
              return const Center(child: Text('No results found'));
            }
            return const LoadingPleaseWait();
          },
        )
      ],
    );
  }
}

class SearchResultCard extends StatelessWidget {
  SearchResultCard({super.key, required this.moviePoster});
  String? moviePoster = baseImageURL;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 100,
        child: moviePoster != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network('$baseImageURL$moviePoster'))
            : Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    'Image not found',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11),
                  ),
                ),
              ));
  }
}
