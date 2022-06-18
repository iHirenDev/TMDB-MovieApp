import 'dart:convert';

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
    //https://api.themoviedb.org/3/movie/upcoming?api_key=9e28f86920815f76754191dddf003442
    // https://api.themoviedb.org/3/movie/popular?api_key=9e28f86920815f76754191dddf003442&language=en-US&page=1
    const String url = '$kBaseUrl/movie/upcoming?api_key=$kApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final upcomingMovies = TrendingMovie.fromJson(json);
      //print('Second title: $upcomingMovies');
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
      print(movieDetails.genres);
      return movieDetails;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
