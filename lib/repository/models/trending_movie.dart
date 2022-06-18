// To parse this JSON data, do
//
//     final trendingMovie = trendingMovieFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

class TrendingMovie {
  TrendingMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<TredndingMovieResult> results;
  int totalPages;
  int totalResults;

  factory TrendingMovie.fromRawJson(String str) =>
      TrendingMovie.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TrendingMovie.fromJson(Map<String, dynamic> json) => TrendingMovie(
        page: json["page"],
        results: List<TredndingMovieResult>.from(
            json["results"].map((x) => TredndingMovieResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class TredndingMovieResult {
  TredndingMovieResult({
    required this.title,
    required this.voteAverage,
    required this.id,
    required this.overview,
    required this.releaseDate,
    required this.adult,
    required this.backdropPath,
    required this.voteCount,
    required this.genreIds,
    required this.video,
    required this.originalLanguage,
    required this.originalTitle,
    required this.posterPath,
    required this.popularity,
    //  required this.mediaType,
  });

  String title;
  double voteAverage;
  int id;
  String overview;
  DateTime releaseDate;
  bool adult;
  String backdropPath;
  int voteCount;
  List<int> genreIds;
  bool video;
  OriginalLanguage? originalLanguage;
  String originalTitle;
  String posterPath;
  double popularity;
  // MediaType? mediaType;

  factory TredndingMovieResult.fromRawJson(String str) =>
      TredndingMovieResult.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TredndingMovieResult.fromJson(Map<String, dynamic> json) =>
      TredndingMovieResult(
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        id: json["id"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        voteCount: json["vote_count"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        video: json["video"],
        originalLanguage: originalLanguageValues.map[json["original_language"]],
        originalTitle: json["original_title"],
        posterPath: json["poster_path"],
        popularity: json["popularity"].toDouble(),
        // mediaType: json["media_type"] == null
        //     ? null
        //     : mediaTypeValues.map[json["media_type"]],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "vote_average": voteAverage,
        "id": id,
        "overview": overview,
        "release_date":
            "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "adult": adult,
        "backdrop_path": backdropPath,
        "vote_count": voteCount,
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
        "video": video,
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_title": originalTitle,
        "poster_path": posterPath,
        "popularity": popularity,
        // "media_type":
        //     mediaType == null ? null : mediaTypeValues.reverse[mediaType],
      };
}

//enum MediaType { MOVIE }

//final mediaTypeValues = EnumValues({"movie": MediaType.MOVIE});

enum OriginalLanguage { EN, KO, IT, NL }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "it": OriginalLanguage.IT,
  "ko": OriginalLanguage.KO,
  "nl": OriginalLanguage.NL
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
