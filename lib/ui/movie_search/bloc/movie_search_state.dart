// ignore_for_file: prefer_const_constructors

part of 'movie_search_bloc.dart';

enum MovieSearchStatus { initial, loading, success, failure, empty }

extension MovieSearchStatusX on MovieSearchStatus {
  bool get isInitial => this == MovieSearchStatus.initial;
  bool get isLoading => this == MovieSearchStatus.loading;
  bool get isSuceess => this == MovieSearchStatus.success;
  bool get isFailure => this == MovieSearchStatus.failure;
  bool get isEmpty => this == MovieSearchStatus.empty;
}

class MovieSearchState extends Equatable {
  const MovieSearchState(
      {this.status = MovieSearchStatus.initial,
      this.searchedMovies = const <SearchMovieResults>[]});

  final MovieSearchStatus status;
  final List<SearchMovieResults> searchedMovies;
  @override
  List<Object> get props => [status, searchedMovies];

  MovieSearchState copyWith(
      {MovieSearchStatus? status, List<SearchMovieResults>? searchedMovies}) {
    return MovieSearchState(
        status: status ?? this.status,
        searchedMovies: searchedMovies ?? this.searchedMovies);
  }
}
