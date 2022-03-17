part of 'upcoming_movie_bloc.dart';

enum UpcomingMovieStatus { initial, loading, success, failure }

extension UpcomingMovieStatusX on UpcomingMovieStatus {
  bool get isInitial => this == UpcomingMovieStatus.initial;
  bool get isLoading => this == UpcomingMovieStatus.loading;
  bool get isSuceess => this == UpcomingMovieStatus.success;
  bool get isFailure => this == UpcomingMovieStatus.failure;
}

class UpcomingMovieState extends Equatable {
  const UpcomingMovieState(
      {this.status = UpcomingMovieStatus.initial,
      this.upcomingMovie = const <Result>[]});

  final UpcomingMovieStatus status;
  final List<Result> upcomingMovie;

  @override
  List<Object> get props => [status, upcomingMovie];

  UpcomingMovieState copyWith(
      {UpcomingMovieStatus? status, List<Result>? upcomingMovie}) {
    return UpcomingMovieState(
      status: status ?? this.status,
      upcomingMovie: upcomingMovie ?? this.upcomingMovie,
    );
  }
}
