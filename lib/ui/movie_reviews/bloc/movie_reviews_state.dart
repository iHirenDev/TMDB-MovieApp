part of 'movie_reviews_bloc.dart';

abstract class MovieReviewsState extends Equatable {
  const MovieReviewsState();
  
  @override
  List<Object> get props => [];
}

class MovieReviewsInitial extends MovieReviewsState {}
