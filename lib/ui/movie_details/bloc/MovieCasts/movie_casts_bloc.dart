// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/movie_casts.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'movie_casts_event.dart';
part 'movie_casts_state.dart';

class MovieCastsBloc extends Bloc<MovieCastsEvent, MovieCastsState> {
  MovieCastsBloc({required this.movieRepository})
      : super(const MovieCastsState()) {
    on<GetMovieCasts>(_fetchMovieCasts);
  }

  final MovieRepository movieRepository;

  void _fetchMovieCasts(
      GetMovieCasts event, Emitter<MovieCastsState> emit) async {
    try {
      emit(state.copyWith(status: MovieCastsStatus.loading));
      final movieCasts = await movieRepository.getMovieCasts(event.movieId);

      emit(state.copyWith(
          status: MovieCastsStatus.success, movieCasts: movieCasts));
    } catch (error) {
      emit(state.copyWith(status: MovieCastsStatus.failure));
    }
  }
}
