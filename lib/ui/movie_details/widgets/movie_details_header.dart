// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_shimmer_effect_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_widget.dart';

import '../bloc/MovieDetails/movie_details_bloc.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
      builder: (context, state) {
        return state.status.isSuceess
            ? Center(
                child: MovieDetailsWidget(movie: state.movieDetails!),
              )
            : state.status.isLoading
                ? MovieDetailsShimmerEffectWidget()
                : state.status.isFailure
                    ? Center(child: Text('Failed to load movie details'))
                    : SizedBox();
      },
    );
  }
}
