part of 'trending_movie_bloc.dart';

abstract class TrendingMovieEvent extends Equatable {
  const TrendingMovieEvent();

  @override
  List<Object> get props => [];
}

class FetchTrendingMovies extends TrendingMovieEvent {
  @override
  List<Object> get props => [];
}
