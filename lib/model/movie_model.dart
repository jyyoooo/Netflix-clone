class Movie {
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  double? voteAverage;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory Movie.fromJson(Map<String, dynamic> jsonMap) {
    return Movie(
        title: jsonMap['title'] ?? 'Movie name null -',
        backDropPath: jsonMap['backdrop_path'],
        originalTitle: jsonMap['original_title'],
        overview: jsonMap['overview'],
        posterPath: jsonMap['poster_path'],
        releaseDate: jsonMap['release_date'],
        voteAverage: jsonMap['vote_average']);
  }
}
