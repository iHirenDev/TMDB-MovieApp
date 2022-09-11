import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'movie_reviews_event.dart';
part 'movie_reviews_state.dart';

class MovieReviewsBloc extends Bloc<MovieReviewsEvent, MovieReviewsState> {
  MovieReviewsBloc() : super(MovieReviewsInitial()) {
    on<MovieReviewsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
