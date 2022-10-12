// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/movie_reviews.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'movie_reviews_event.dart';
part 'movie_reviews_state.dart';

class MovieReviewsBloc extends Bloc<MovieReviewsEvent, MovieReviewsState> {
  MovieReviewsBloc({required this.movieRepository})
      : super(MovieReviewsState()) {
    on<GetReviews>(_fetchMovieReviews);
  }

  final MovieRepository movieRepository;

  void _fetchMovieReviews(
      GetReviews event, Emitter<MovieReviewsState> emit) async {
    try {
      emit(state.copyWith(status: MovieReviewsStatus.loading));
      final movieReviews = await movieRepository.getMovieReviews(event.movieId);
      emit(state.copyWith(
          status: MovieReviewsStatus.success, reviews: movieReviews));
    } catch (error) {
      emit(state.copyWith(status: MovieReviewsStatus.failure));
    }
  }
}
