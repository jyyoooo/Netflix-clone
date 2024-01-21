import 'dart:convert';
import 'package:netflix/controller/api_end_points.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/model/movie_model.dart';

class APIService {
  Future<List<Movie>> getTrendingMovies() async {
    final uri = Uri.parse(trendingToday);
    final response = await http.get(uri);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodedata = jsonDecode(response.body);
      final trendingList = decodedata['results'] as List;
      // print(trendingList);
      return trendingList.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final uri = Uri.parse(upcomingMovies);
    final response = await http.get(uri);
    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      final upcomingList = decodeData['results'] as List;
      return upcomingList.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<List<Movie>> getTopTenTVShows() async {
    final uri = Uri.parse(topTVshows);
    final response = await http.get(uri);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      final topTenList = decodeData['results'] as List;
      return topTenList.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<List<Movie>> getNewReleases() async {
    final uri = Uri.parse(newReleases);
    final response = await http.get(uri);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      final newReleasesList = decodeData['results'] as List;
      return newReleasesList.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<List<Movie>> getPopularShows() async {
    final uri = Uri.parse(popular);
    final response = await http.get(uri);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      final popularList = decodeData['results'] as List;
      return popularList.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }

  Future<List<Movie>> getSearchResults(String query) async {
    final uri = Uri.parse(search + query);
    final response = await http.get(uri);

    print(response.statusCode);

    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body);
      final searchResult = decodeData['results'] as List;
      return searchResult.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }
}
