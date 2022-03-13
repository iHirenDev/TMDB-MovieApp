// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/trending_movie_bloc.dart';

import '../../../helper/constants.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: kDefaultPadding,
              top: kDefaultPadding / 2,
              bottom: kDefaultPadding * 2.5,
            ),
            width: size.width * 0.4,
            child: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.all(kDefaultPadding / 2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23),
                      ),
                    ],
                  ),
                  child: FadeInImage.assetNetwork(
                      placeholder: 'placeholder',
                      image: 'state.trendingMovie[0].posterPath'))
            ]),
          )
        ],
      ),
    );
  }
}

class Movie extends StatelessWidget {
  const Movie(
      {Key? key,
      required this.title,
      required this.releaseDate,
      required this.posterPath,
      required this.voteAverage})
      : super(key: key);

  final String title;
  final String releaseDate;
  final String posterPath;
  final double voteAverage;

  final String imageBaseUrl = 'https://image.tmdb.org/t/p/w185/';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width * 0.4,
      child: Column(
        children: <Widget>[
          FadeInImage.assetNetwork(
              placeholder: 'assests/movies.png',
              image: imageBaseUrl + posterPath),
          Text(title),
          //Text(releaseDate)
        ],
      ),
    );
  }
}
