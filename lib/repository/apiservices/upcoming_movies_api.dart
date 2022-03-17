import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';

class UpcomingMoviesAPI {
  Future<List<Result>> getUpcomingMovies() async {
    //https://api.themoviedb.org/3/movie/upcoming?api_key=9e28f86920815f76754191dddf003442
    const url = '$kBaseUrl/movie/upcoming?api_key=$kApiKey';

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
