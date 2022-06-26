// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/movie_details/bloc/movie_details_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_shimmer_effect_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_widget.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  final TredndingMovieResult movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          backgroundColor: kPrimaryColor,
        ),
        body: RepositoryProvider(
          create: (context) =>
              MovieRepository(trendingMovieAPI: TrendingMovieAPI()),
          child: BlocProvider(
              create: (context) => MovieDetailsBloc(
                  movieRepository: context.read<MovieRepository>())
                ..add(SelectMovie(selectedId: movie.id)),
              child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                builder: (context, state) {
                  return state.status.isSuceess
                      ? Center(
                          child: MovieDetailsWidget(movie: state.movieDetails!),
                        )
                      : state.status.isLoading
                          ? MovieDetailsShimmerEffectWidget()
                          : state.status.isFailure
                              ? Center(
                                  child: Text('Failed to load movie details'))
                              : SizedBox();
                },
              )),
        ));
  }

  _delayedFunction() {
    Future.delayed(Duration(milliseconds: 300), () {
      MovieDetailsShimmerEffectWidget();
    });
  }
}
