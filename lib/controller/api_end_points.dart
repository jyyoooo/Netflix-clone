import 'package:netflix/controller/api_key.dart';

const baseURL = 'https://api.themoviedb.org/3';

const baseImageURL = 'https://image.tmdb.org/t/p/w500';

const trendingToday = '$baseURL/trending/all/day?api_key=$apiKey';

const upcomingMovies = '$baseURL/movie/upcoming?api_key=$apiKey';

const topTVshows = '$baseURL/tv/top_rated?api_key=$apiKey';

const newReleases = '$baseURL/movie/now_playing?api_key=$apiKey';

const popular = '$baseURL/movie/popular?api_key=$apiKey';

const search = '$baseURL/search/movie?api_key=$apiKey&query=';
