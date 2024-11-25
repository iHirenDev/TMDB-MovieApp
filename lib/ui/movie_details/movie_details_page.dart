// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/movie_details/bloc/MovieCasts/movie_casts_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/bloc/MovieDetails/movie_details_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/bloc/SimilarMovies/similar_movies_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_casts_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_header.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_shimmer_effect_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_details_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/similar_movies_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_reviews/movie_reviews_page.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(
      {Key? key,
      required this.id,
      required this.movieTitle,
      required this.ratings})
      : super(key: key);

  final int id;
  final String movieTitle;
  final double ratings;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            movieTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: RepositoryProvider(
            create: (context) =>
                MovieRepository(trendingMovieAPI: TrendingMovieAPI()),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                    create: (context) => MovieDetailsBloc(
                        movieRepository: context.read<MovieRepository>())
                      ..add(SelectMovie(selectedId: id))),
                BlocProvider(
                    create: (context) => MovieCastsBloc(
                        movieRepository: context.read<MovieRepository>())
                      ..add(GetMovieCasts(movieId: id))),
                BlocProvider(
                    create: (context) => SimilarMoviesBloc(
                        movieRepository: context.read<MovieRepository>())
                      ..add(GetSimilarMovies(movieId: id)))
              ],
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      MovieDetailsHeader(),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Cast',
                          style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                      MovieCastsWidget(),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          child: Row(
                            children: <Widget>[
                              Text('Reviews',
                                  style: TextStyle(
                                      color: kTextColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28)),
                              Expanded(child: SizedBox()),
                              Icon(
                                Icons.chevron_right_sharp,
                                color: Colors.white,
                                size: 28,
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MovieReviewsPage(
                                      movieId: id,
                                      ratings: ratings,
                                    )));
                          },
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Similar Movies',
                          style: TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 28),
                        ),
                      ),
                      SimilarMoviesWidget()
                    ],
                  ),
                ),
              ),
            )));
  }

  _delayedFunction() {
    Future.delayed(Duration(milliseconds: 300), () {
      MovieDetailsShimmerEffectWidget();
    });
  }
}
