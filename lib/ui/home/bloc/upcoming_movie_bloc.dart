// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'upcoming_movie_event.dart';
part 'upcoming_movie_state.dart';

class UpcomingMovieBloc extends Bloc<UpcomingMovieEvent, UpcomingMovieState> {
  UpcomingMovieBloc({required this.movieRepository})
      : super(UpcomingMovieState()) {
    on<FetchUpcomingMovie>(_fetchUpcomingMovies);
  }

  final MovieRepository movieRepository;

  void _fetchUpcomingMovies(
      FetchUpcomingMovie event, Emitter<UpcomingMovieState> emit) async {
    try {
      emit(state.copyWith(status: UpcomingMovieStatus.loading));
      final movies = await movieRepository.getUpcomingMovies();

      emit(state.copyWith(
        status: UpcomingMovieStatus.success,
        upcomingMovie: movies,
      ));
    } catch (error) {
      emit(state.copyWith(status: UpcomingMovieStatus.failure));
    }
  }
}
