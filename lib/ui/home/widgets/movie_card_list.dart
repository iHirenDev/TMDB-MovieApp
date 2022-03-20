// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/shimmer_effect.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/trending_movie_bloc.dart';
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
/*
      switch (state.status) {
        case TrendingMovieStatus.failure:
          return const Center(
            child: Text('Failed'),
          );

        case TrendingMovieStatus.loading:
          return const Center(
            child: CircularProgressIndicator(),
          );

        case TrendingMovieStatus.success:
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.trendingMovie.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              width: size.width * 0.4,
                              margin: EdgeInsets.only(
                                  left: kDefaultPadding,
                                  top: kDefaultPadding / 2,
                                  bottom: kDefaultPadding * 2.5,
                                  right: kDefaultPadding),

                              child: Column(
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: FadeInImage.assetNetwork(
                                        height: size.height * 0.30,
                                        width: size.width * 0.4,
                                        fit: BoxFit.fill,
                                        placeholder: 'assets/movies.png',
                                        image: imageBaseUrl +
                                            state.trendingMovie[index]
                                                .posterPath),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          state.trendingMovie[index].title,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[800],
                                          ),
                                          Text(
                                              state.trendingMovie[index]
                                                  .voteAverage
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              // color: Colors.green[700]
                            ),
                          ],
                        );
                      }),
                )
              ],
            ),
          );
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      } */
    });
  }
}
