// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/UpcomingMovies/upcoming_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movies_list.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/shimmer_effect_list.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/test_list.dart';

class UpcomingMovieList extends StatelessWidget {
  const UpcomingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<UpcomingMovieBloc, UpcomingMovieState>(
      builder: (context, state) {
        return state.status.isSuceess
            ? MoviesList(movie: state.upcomingMovie, size: size)
            : state.status.isLoading
                ? SizedBox(
                    height: size.height * 0.37, child: ShimmerEffectList())
                : Center(
                    child: SizedBox(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding),
                          child: Text(
                            'Failed to load upcoming movies',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
      },
    );
  }
}
