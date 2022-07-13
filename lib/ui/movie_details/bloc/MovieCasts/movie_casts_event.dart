// ignore_for_file: prefer_const_constructors_in_immutables

part of 'movie_casts_bloc.dart';

abstract class MovieCastsEvent extends Equatable {
  const MovieCastsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieCasts extends MovieCastsEvent {
  final int movieId;

  GetMovieCasts({required this.movieId});

  @override
  List<Object> get props => [movieId];
}
