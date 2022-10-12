import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/models/movie_casts.dart';
import 'package:flutter_bloc_demo/repository/models/movie_details.dart';
import 'package:flutter_bloc_demo/repository/models/movie_reviews.dart';
import 'package:flutter_bloc_demo/repository/models/search_movie.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/models/upcoming_movie.dart';

class MovieRepository {
  const MovieRepository({required this.trendingMovieAPI});
  final TrendingMovieAPI trendingMovieAPI;
  // final UpcomingMoviesAPI upcomingMoviesAPI;

  Future<List<TredndingMovieResult>> getTrendingMovies() async =>
      trendingMovieAPI.getTrendingMovie();

  Future<List<TredndingMovieResult>> getUpcomingMovies() async =>
      trendingMovieAPI.getUpcomingMovies();

  Future<MovieDetails> getMovieDetails(int movieId) async =>
      trendingMovieAPI.getMovieDetails(movieId);

  Future<List<Cast>> getMovieCasts(int movieId) async =>
      trendingMovieAPI.getMovieCasts(movieId);

  Future<List<TredndingMovieResult>> getSimilarMovies(int movieId) async =>
      trendingMovieAPI.getSimilarMovies(movieId);

  Future<List<SearchMovieResults>> searchMovies(String query) async =>
      trendingMovieAPI.searchMovies(query);

  Future<List<Reviews>> getMovieReviews(int movieId) async =>
      trendingMovieAPI.getReviewsforMovie(movieId);
}
