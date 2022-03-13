// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'trending_movie_event.dart';
part 'trending_movie_state.dart';

class TrendingMovieBloc extends Bloc<TrendingMovieEvent, TrendingMovieState> {
  TrendingMovieBloc({required this.movieRepository})
      : super(const TrendingMovieState()) {
    on<FetchTrendingMovies>(_fetchTrendingMovies);
  }

  final MovieRepository movieRepository;

  void _fetchTrendingMovies(
      FetchTrendingMovies event, Emitter<TrendingMovieState> emit) async {
    try {
      emit(state.copyWith(status: TrendingMovieStatus.loading));
      final movies = await movieRepository.getTrendingMovies();

      emit(state.copyWith(
        status: TrendingMovieStatus.success,
        trendingMovie: movies,
      ));
    } catch (error) {
      emit(state.copyWith(status: TrendingMovieStatus.failure));
    }
  }
}
