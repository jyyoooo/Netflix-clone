import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';
import 'widgets/coming_soon_info_card.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIService().getUpcomingMovies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const LoadingPleaseWait();
          }

          if (snapshot.data == null) {
            return const Text('No data found');
          }

          return ListView.builder(
            physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) =>
                  ComingSoonInfoCard(movie: snapshot.data![index]));
        });
  }
}
