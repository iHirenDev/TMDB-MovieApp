// // ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/TrendingMovies/trending_movie_bloc.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
      builder: (context, state) {
        return state.status.isSuceess ? Text('data') : Text('data');
      },
    );
  }
}
