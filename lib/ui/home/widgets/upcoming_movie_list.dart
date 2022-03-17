// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/upcoming_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movies_list.dart';

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
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: SizedBox(),
                  );
      },
    );
  }
}
