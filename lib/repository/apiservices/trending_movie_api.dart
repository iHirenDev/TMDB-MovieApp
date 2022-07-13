import 'dart:convert';

import 'package:flutter_bloc_demo/repository/models/movie_casts.dart';
import 'package:flutter_bloc_demo/repository/models/movie_details.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/models/upcoming_movie.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc_demo/helper/constants.dart';

class TrendingMovieAPI {
  Future<List<TredndingMovieResult>> getTrendingMovie() async {
    const String url = '$kBaseUrl/trending/movie/day?api_key=$kApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final trendingMovies = TrendingMovie.fromJson(json);

      return trendingMovies.results;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<List<TredndingMovieResult>> getUpcomingMovies() async {
    const String url = '$kBaseUrl/movie/popular?api_key=$kApiKey';

// https://api.themoviedb.org/3/movie/popular?api_key=9e28f86920815f76754191dddf003442
    const String newUrl = '$kBaseUrl/trending/movie/day?api_key=$kApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      //print(json);
      final upcomingMovies = TrendingMovie.fromJson(json);
      // print(upcomingMovies.results[0].originalTitle);
      return upcomingMovies.results;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<MovieDetails> getMovieDetails(int movieId) async {
    String url = '$kBaseUrl/movie/$movieId?api_key=$kApiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final movieDetails = MovieDetails.fromJson(json);
      return movieDetails;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }

  Future<List<Cast>> getMovieCasts(int movieId) async {
    String url = '$kBaseUrl/movie/$movieId/credits?api_key=$kApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final movieCasts = MovieCasts.fromJson(json);
      print(movieCasts.id);
      return movieCasts.cast;
    } else {
      throw Exception('Failed to fetch movie casts');
    }
  }

  Future<List<TredndingMovieResult>> getSimilarMovies(int movieId) async {
    String url = '$kBaseUrl/movie/$movieId/similar?api_key=$kApiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final similarMovies = TrendingMovie.fromJson(json);

      return similarMovies.results;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
