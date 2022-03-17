import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/apiservices/upcoming_movies_api.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';

class MovieRepository {
  const MovieRepository({required this.trendingMovieAPI});
  final TrendingMovieAPI trendingMovieAPI;
  // final UpcomingMoviesAPI upcomingMoviesAPI;

  Future<List<Result>> getTrendingMovies() async =>
      trendingMovieAPI.getTrendingMovie();

  Future<List<Result>> getUpcomingMovies() async =>
      trendingMovieAPI.getUpcomingMovies();
}
