import 'package:flutter/material.dart';
import 'package:netflix/controller/api_service.dart';
import 'package:netflix/view/widgets/numbertitlemovie.dart';
import 'widgets/everyones_watching_info_card.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: APIService().getPopularShows(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            const LoadingPleaseWait();
          }
          if (snapshot.data == null) {
            return const Center(child: Text('No data found'));
          }
          return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) =>
                  EveryonesWatchingInfoCard(movie: snapshot.data![index]));
        });
  }
}
