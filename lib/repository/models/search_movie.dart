// ignore_for_file: prefer_if_null_operators, unnecessary_null_comparison, prefer_null_aware_operators

///////////\\\\\\\\\\

import 'dart:convert';

SearchMovie searchMovieFromJson(String str) =>
    SearchMovie.fromJson(json.decode(str));

String searchMovieToJson(SearchMovie data) => json.encode(data.toJson());

class SearchMovie {
  SearchMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<SearchMovieResults>? results;
  final int totalPages;
  final int totalResults;

  factory SearchMovie.fromJson(Map<String, dynamic> json) => SearchMovie(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null
            ? null
            : List<SearchMovieResults>.from(
                json["results"].map((x) => SearchMovieResults.fromJson(x))),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults:
            json["total_results"] == null ? null : json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page == null ? null : page,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
      };
}

class SearchMovieResults {
  SearchMovieResults({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int>? genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory SearchMovieResults.fromJson(Map<String, dynamic> json) =>
      SearchMovieResults(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null
            ? '/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg'
            : json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
        originalLanguage: json["original_language"] == null
            ? null
            : json["original_language"],
        originalTitle:
            json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity:
            json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"] == null
            ? '/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg'
            : json["poster_path"],
        releaseDate: json["release_date"] == null ? null : json["release_date"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null
            ? null
            : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "genre_ids": genreIds == null
            ? null
            : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id == null ? null : id,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath == null ? null : posterPath,
        "release_date": releaseDate == null ? null : releaseDate,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
      };
}

////////\\\\\\\

