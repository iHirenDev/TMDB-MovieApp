// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/bloc/MovieCasts/movie_casts_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_casts_list_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_shimmer_effect_widget.dart';

class MovieCastsWidget extends StatelessWidget {
  const MovieCastsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastsBloc, MovieCastsState>(
      builder: (BuildContext context, state) {
        return state.status.isSuceess
            ? state.movieCasts.isEmpty
                ? SizedBox(
                    height: 100,
                    child: Center(
                        child: Text(
                      'Cannot find casts for this movie.',
                      style: TextStyle(fontSize: 22),
                    )),
                  )
                : MovieCastsListWidget(movieCasts: state.movieCasts)
            : state.status.isLoading
                ? RowShimmerWidget()
                : state.status.isFailure
                    ? Center(child: Text('Failed to fetch movie casts'))
                    : Center(
                        child: Text('Something went wrong. Please try again.'),
                      );
      },
    );
  }
}
