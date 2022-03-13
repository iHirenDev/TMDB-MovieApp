// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/trending_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movie_card.dart';

import '../../../helper/constants.dart';

class MovieCardList extends StatelessWidget {
  const MovieCardList({Key? key}) : super(key: key);

  final imageBaseUrl = 'https://image.tmdb.org/t/p/w185/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<TrendingMovieBloc, TrendingMovieState>(
        builder: (context, state) {
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
                                        height: size.height * 0.28,
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
                                              fontSize: 20,
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

        // SingleChildScrollView(
        //   scrollDirection: Axis.horizontal,
        //   child: Row(
        //     children: <Widget>[
        //       Container(
        //         margin: EdgeInsets.only(
        //           left: kDefaultPadding,
        //           top: kDefaultPadding / 2,
        //           bottom: kDefaultPadding * 2.5,
        //         ),
        //         width: size.width * 0.4,
        //         child: Column(children: <Widget>[
        //           Container(
        //               padding: EdgeInsets.all(kDefaultPadding / 2),
        //               decoration: BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.only(
        //                   bottomLeft: Radius.circular(10),
        //                   bottomRight: Radius.circular(10),
        //                 ),
        //                 boxShadow: [
        //                   BoxShadow(
        //                     offset: Offset(0, 10),
        //                     blurRadius: 50,
        //                     color: kPrimaryColor.withOpacity(0.23),
        //                   ),
        //                 ],
        //               ),
        //               child: Column(
        //                 children: <Widget>[
        //                   FadeInImage.assetNetwork(
        //                       placeholder: 'assets/movies.png',
        //                       image: imageBaseUrl +
        //                           state.trendingMovie[0].posterPath),
        //                   Text(state.trendingMovie[0].voteAverage.toString()),
        //                   Text(state.trendingMovie[0].title)
        //                 ],
        //               ))
        //         ]),
        //       )
        //     ],
        //   ),
        // );
        default:
          return const Center(
            child: CircularProgressIndicator(),
          );
      }
    });
  }
}
