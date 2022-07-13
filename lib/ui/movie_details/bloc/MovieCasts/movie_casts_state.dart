part of 'movie_casts_bloc.dart';

enum MovieCastsStatus { initial, loading, success, failure }

extension MovieCatsStatusX on MovieCastsStatus {
  bool get isInitial => this == MovieCastsStatus.initial;
  bool get isLoading => this == MovieCastsStatus.loading;
  bool get isSuceess => this == MovieCastsStatus.success;
  bool get isFailure => this == MovieCastsStatus.failure;
}

class MovieCastsState extends Equatable {
  const MovieCastsState(
      {this.status = MovieCastsStatus.initial,
      this.movieCasts = const <Cast>[]});

  final MovieCastsStatus status;
  final List<Cast> movieCasts;

  @override
  List<Object> get props => [status, movieCasts];

  MovieCastsState copyWith({MovieCastsStatus? status, List<Cast>? movieCasts}) {
    return MovieCastsState(
        status: status ?? this.status,
        movieCasts: movieCasts ?? this.movieCasts);
  }
}
