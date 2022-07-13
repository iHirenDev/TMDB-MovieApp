import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_demo/repository/models/movie_details.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc({required this.movieRepository})
      : super(const MovieDetailsState()) {
    on<SelectMovie>(_fetchMovieDetails);
  }

  final MovieRepository movieRepository;

  void _fetchMovieDetails(
      SelectMovie event, Emitter<MovieDetailsState> emit) async {
    try {
      emit(state.copyWith(status: MovieDetailsStatus.loading));
      final movieDetails =
          await movieRepository.getMovieDetails(event.selectedId);

      emit(state.copyWith(
          status: MovieDetailsStatus.success, movieDetails: movieDetails));
    } catch (error) {
      emit(state.copyWith(status: MovieDetailsStatus.failure));
    }
  }
}
