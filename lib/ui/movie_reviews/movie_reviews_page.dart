// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/movie_reviews/bloc/movie_reviews_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_reviews/widgets/movie_reviews_widget.dart';

class MovieReviewsPage extends StatelessWidget {
  const MovieReviewsPage(
      {Key? key, required this.movieId, required this.ratings})
      : super(key: key);

  final int movieId;
  final double ratings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Reviews',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: RepositoryProvider(
          create: (context) =>
              MovieRepository(trendingMovieAPI: TrendingMovieAPI()),
          child: BlocProvider(
              create: (context) => MovieReviewsBloc(
                  movieRepository: context.read<MovieRepository>())
                ..add(GetReviews(movieId: movieId)),
              child: MovieReviewsWidget(
                ratings: ratings,
              )),
        ));
  }
}
