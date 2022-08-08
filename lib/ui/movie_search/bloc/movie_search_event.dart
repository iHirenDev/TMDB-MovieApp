// ignore_for_file: prefer_const_constructors_in_immutables

part of 'movie_search_bloc.dart';

abstract class MovieSearchEvent extends Equatable {
  const MovieSearchEvent();

  @override
  List<Object> get props => [];
}

class SearchMovieEvent extends MovieSearchEvent {
  final String query;

  SearchMovieEvent({required this.query});

  @override
  List<Object> get props => [query];
}
