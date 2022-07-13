// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/shimmer_effect.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/TrendingMovies/trending_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movies_list.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/shimmer_effect_list.dart';

class MovieCardList extends StatelessWidget {
  const MovieCardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        builder: (context, state) {
      return state.status.isSuceess
          ? MoviesList(movie: state.trendingMovie, size: size)
          : state.status.isLoading
              ? SizedBox(height: size.height * 0.37, child: ShimmerEffectList())
              : state.status.isFailure
                  ? Center(child: Text('Failed to fetch movies'))
                  : SizedBox();
    });
  }
}
