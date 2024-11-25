part of 'similar_movies_bloc.dart';

enum SimilarMoviesStatus { initial, loading, success, failure }

extension SimilarMoviesStatusX on SimilarMoviesStatus {
  bool get isInitial => this == SimilarMoviesStatus.initial;
  bool get isLoading => this == SimilarMoviesStatus.loading;
  bool get isSuccess => this == SimilarMoviesStatus.success;
  bool get isFailure => this == SimilarMoviesStatus.failure;
}

class SimilarMoviesState extends Equatable {
  const SimilarMoviesState(
      {this.status = SimilarMoviesStatus.initial,
      this.similarMovies = const <SimilarMoviesResults>[]});

  final SimilarMoviesStatus status;
  final List<SimilarMoviesResults> similarMovies;
  @override
  List<Object> get props => [status, similarMovies];

  SimilarMoviesState copyWith(
      {SimilarMoviesStatus? status,
      List<SimilarMoviesResults>? similarMovies}) {
    return SimilarMoviesState(
        status: status ?? this.status,
        similarMovies: similarMovies ?? this.similarMovies);
  }
}
