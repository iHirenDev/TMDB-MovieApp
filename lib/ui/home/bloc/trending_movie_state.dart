// ignore_for_file: prefer_const_constructors_in_immutables

part of 'trending_movie_bloc.dart';

enum TrendingMovieStatus { initial, loading, success, failure }

extension TrendinMovieStatusX on TrendingMovieStatus {
  bool get isInitial => this == TrendingMovieStatus.initial;
  bool get isLoading => this == TrendingMovieStatus.loading;
  bool get isSuceess => this == TrendingMovieStatus.success;
  bool get isFailure => this == TrendingMovieStatus.failure;
}

class TrendingMovieState extends Equatable {
  const TrendingMovieState(
      {this.status = TrendingMovieStatus.initial,
      this.trendingMovie = const <Result>[]});

  final TrendingMovieStatus status;
  final List<Result> trendingMovie;

  @override
  List<Object> get props => [status, trendingMovie];

  TrendingMovieState copyWith(
      {TrendingMovieStatus? status, List<Result>? trendingMovie}) {
    return TrendingMovieState(
      status: status ?? this.status,
      trendingMovie: trendingMovie ?? this.trendingMovie,
    );
  }
}

/*
class TrendingMovieInitial extends TrendingMovieState {}

class TrendingMovieLoading extends TrendingMovieState {}

class TrendingMovieLoaded extends TrendingMovieState {
  late final List<Result> results;
  TrendingMovieLoaded({required this.results});
}*/
