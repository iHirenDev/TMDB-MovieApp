// ignore_for_file: prefer_const_constructors

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/search_movie.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'movie_search_event.dart';
part 'movie_search_state.dart';

class MovieSearchBloc extends Bloc<MovieSearchEvent, MovieSearchState> {
  MovieSearchBloc({required this.movieRepository}) : super(MovieSearchState()) {
    on<SearchMovieEvent>(_fetchSearchedMovies);
  }
  final MovieRepository movieRepository;

  void _fetchSearchedMovies(
      SearchMovieEvent event, Emitter<MovieSearchState> emit) async {
    try {
      emit(state.copyWith(status: MovieSearchStatus.loading));

      final searchedMovies = await movieRepository.searchMovies(event.query);

      event.query.isEmpty
          ? emit(state
              .copyWith(status: MovieSearchStatus.empty, searchedMovies: []))
          : emit(state.copyWith(
              status: MovieSearchStatus.success,
              searchedMovies: searchedMovies));
    } catch (error) {
      state.copyWith(status: MovieSearchStatus.failure);
    }
  }
}
