import 'dart:convert';

import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:http/http.dart' as http;

class TrendingMovieAPI {
  final apiKey = 'YOUR API KEY HERE';

  final baseUrl = 'https://api.themoviedb.org/3';

  final imageBaseUrl = 'https://image.tmdb.org/t/p/w185/';

  Future<List<Result>> getTrendingMovie() async {
    final String url = '$baseUrl/trending/movie/day?api_key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);

      final trendingMovies = TrendingMovie.fromJson(json);
      return trendingMovies.results;
    } else {
      throw Exception('Failed to fetch movies');
    }
  }
}
