import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/similar_movies.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'similar_movies_event.dart';
part 'similar_movies_state.dart';

class SimilarMoviesBloc extends Bloc<SimilarMoviesEvent, SimilarMoviesState> {
  SimilarMoviesBloc({required this.movieRepository})
      : super(const SimilarMoviesState()) {
    on<GetSimilarMovies>(_fetchSimilarMovies);
  }
  final MovieRepository movieRepository;

  void _fetchSimilarMovies(
      GetSimilarMovies event, Emitter<SimilarMoviesState> emit) async {
    try {
      emit(state.copyWith(status: SimilarMoviesStatus.loading));
      final similarMovies =
          await movieRepository.getSimilarMovies(event.movieId);
      emit(state.copyWith(
          status: SimilarMoviesStatus.success, similarMovies: similarMovies));
    } catch (error) {
      emit(state.copyWith(status: SimilarMoviesStatus.failure));
    }
  }
}
