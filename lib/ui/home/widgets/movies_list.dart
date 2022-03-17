// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../helper/constants.dart';
import '../../../repository/models/trending_movie.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key, required this.movie, required this.size})
      : super(key: key);

  final List<Result> movie;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.4,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movie.length,
          itemBuilder: (context, index) {
            return Container(
              width: size.width * 0.47,
              margin: EdgeInsets.only(
                  left: kDefaultPadding,
                  top: kDefaultPadding / 2,
                  bottom: kDefaultPadding * 0.8,
                  right: kDefaultPadding),
              decoration: BoxDecoration(
                  border: Border.all(width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Stack(
                children: <Widget>[
                  FadeInImage.assetNetwork(
                      width: size.width * 0.47,
                      fit: BoxFit.fill,
                      placeholder: 'assets/movies.png',
                      image: kImageBaseUrl + movie[index].posterPath),
                  Positioned(
                    bottom: 3,
                    left: 3,
                    right: 3,
                    child: Text(
                      movie[index].title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: CircleAvatar(
                      backgroundColor: kTextColor,
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                          ),
                          Text(movie[index].voteAverage.toString(),
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
