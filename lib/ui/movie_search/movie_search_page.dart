// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/movie_search/bloc/movie_search_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_search/widgets/movie_search_field_widget.dart';

class MovieSearchPage extends StatelessWidget {
  const MovieSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Search Movie'),
          backgroundColor: kPrimaryColor,
        ),
        body: RepositoryProvider(
          create: (context) =>
              MovieRepository(trendingMovieAPI: TrendingMovieAPI()),
          child: BlocProvider(
            create: (context) => MovieSearchBloc(
                movieRepository: context.read<MovieRepository>()),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MovieSearchFieldWidget())
                ],
              ),
            ),
          ),
        ));
  }
}

/*
Column(
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: MovieSearchFieldWidget())
        ],
      ),
*/