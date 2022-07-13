part of 'movie_details_bloc.dart';

enum MovieDetailsStatus { initial, loading, success, failure }

extension MovieDetailsStatusX on MovieDetailsStatus {
  bool get isInitial => this == MovieDetailsStatus.initial;
  bool get isLoading => this == MovieDetailsStatus.loading;
  bool get isSuceess => this == MovieDetailsStatus.success;
  bool get isFailure => this == MovieDetailsStatus.failure;
}

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.status = MovieDetailsStatus.initial, this.movieDetails});

  final MovieDetailsStatus status;
  final MovieDetails? movieDetails;

  @override
  List<Object> get props => [status];

  MovieDetailsState copyWith(
      {MovieDetailsStatus? status, MovieDetails? movieDetails}) {
    return MovieDetailsState(
        status: status ?? this.status,
        movieDetails: movieDetails ?? this.movieDetails);
  }
}
