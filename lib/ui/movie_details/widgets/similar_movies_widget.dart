// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/shimmer_effect_list.dart';
import 'package:flutter_bloc_demo/ui/movie_details/bloc/SimilarMovies/similar_movies_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/similar_movies_list_widget.dart';

import '../../../helper/constants.dart';

class SimilarMoviesWidget extends StatelessWidget {
  const SimilarMoviesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<SimilarMoviesBloc, SimilarMoviesState>(
      builder: (context, state) {
        return state.status.isSuccess
            ? state.similarMovies.isEmpty
                ? SizedBox(
                    height: 100,
                    child: Center(
                        child: Text(
                      'Cannot find similar movies.',
                      style: TextStyle(fontSize: 22),
                    )),
                  )
                : SimilarMoviesListWidget(similarMovie: state.similarMovies)
            : state.status.isLoading
                ? SizedBox(
                    height: size.height * 0.37, child: ShimmerEffectList())
                : state.status.isFailure
                    ? Center(
                        child: Text(
                        'Failed to fetch similar movies',
                        style: TextStyle(fontSize: 22, color: kTextColor),
                      ))
                    : SizedBox();
      },
    );
  }
}
