// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/apiservices/upcoming_movies_api.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/trending_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/header.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movie_card_list.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/upcoming_movie_list.dart';

import 'bloc/upcoming_movie_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,
        ),
        body: RepositoryProvider(
            create: (context) => MovieRepository(
                  trendingMovieAPI: TrendingMovieAPI(),
                ),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => TrendingMovieBloc(
                      movieRepository: context.read<MovieRepository>())
                    ..add(FetchTrendingMovies()),
                ),
                BlocProvider(
                  create: (context) => UpcomingMovieBloc(
                      movieRepository: context.read<MovieRepository>())
                    ..add(FetchUpcomingMovie()),
                ),
              ],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header(size: size),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        'Trending Movies',
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    MovieCardList(),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    UpcomingMovieList()
                  ],
                ),
              ),
            )));
  }
}
