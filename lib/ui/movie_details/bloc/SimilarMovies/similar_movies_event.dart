// ignore_for_file: prefer_const_constructors_in_immutables

part of 'similar_movies_bloc.dart';

class SimilarMoviesEvent extends Equatable {
  const SimilarMoviesEvent();

  @override
  List<Object> get props => [];
}

class GetSimilarMovies extends SimilarMoviesEvent {
  final int movieId;

  GetSimilarMovies({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
