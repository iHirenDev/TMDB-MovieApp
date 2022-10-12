// ignore_for_file: prefer_const_constructors_in_immutables, annotate_overrides

part of 'movie_reviews_bloc.dart';

abstract class MovieReviewsEvent extends Equatable {
  const MovieReviewsEvent();

  @override
  List<Object> get props => [];
}

class GetReviews extends MovieReviewsEvent {
  final int movieId;

  GetReviews({required this.movieId});

  List<Object> get props => [movieId];
}
