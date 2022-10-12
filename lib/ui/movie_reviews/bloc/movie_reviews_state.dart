// ignore_for_file: prefer_const_constructors

part of 'movie_reviews_bloc.dart';

enum MovieReviewsStatus { initial, loading, success, failure }

extension MovieReviewsStatusX on MovieReviewsStatus {
  bool get isInitial => this == MovieReviewsStatus.initial;
  bool get isLoading => this == MovieReviewsStatus.loading;
  bool get isSuccess => this == MovieReviewsStatus.success;
  bool get isFailure => this == MovieReviewsStatus.failure;
}

class MovieReviewsState extends Equatable {
  const MovieReviewsState(
      {this.status = MovieReviewsStatus.initial,
      this.reviews = const <Reviews>[]});

  final MovieReviewsStatus status;
  final List<Reviews> reviews;
  @override
  List<Object> get props => [status, reviews];

  MovieReviewsState copyWith(
      {MovieReviewsStatus? status, List<Reviews>? reviews}) {
    return MovieReviewsState(
        status: status ?? this.status, reviews: reviews ?? this.reviews);
  }
}
