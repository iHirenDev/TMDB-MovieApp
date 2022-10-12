// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_reviews/bloc/movie_reviews_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_reviews/widgets/movie_reviews_list.dart';

class MovieReviewsWidget extends StatelessWidget {
  const MovieReviewsWidget({Key? key, required this.ratings}) : super(key: key);
  final double ratings;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieReviewsBloc, MovieReviewsState>(
        builder: (BuildContext context, state) {
      return state.status.isSuccess
          ? MovieReviewsList(
              reviews: state.reviews,
              ratings: ratings,
            )
          : state.status.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state.status.isFailure
                  ? Center(
                      child: Text('Failed to fetch reviews'),
                    )
                  : Center(
                      child: Text('Something went wrong please try again'),
                    );
    });
  }
}
