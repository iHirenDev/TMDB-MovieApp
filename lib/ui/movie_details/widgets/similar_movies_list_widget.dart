// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/ui/movie_details/movie_details_page.dart';

class SimilarMoviesListWidget extends StatelessWidget {
  const SimilarMoviesListWidget({Key? key, required this.similarMovie})
      : super(key: key);

  final List<TredndingMovieResult> similarMovie;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.37,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: similarMovie.length,
          itemBuilder: (context, index) {
            return InkWell(
              child: Container(
                width: size.width * 0.47,
                margin: EdgeInsets.only(
                    left: kDefaultPadding,
                    top: kDefaultPadding / 2,
                    bottom: kDefaultPadding * 0.8,
                    right: kDefaultPadding),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0))),
                child: Stack(
                  children: <Widget>[
                    // FadeInImage.assetNetwork(
                    //     height: size.height * 0.35,
                    //     width: size.width * 0.47,
                    //     fit: BoxFit.cover,
                    //     placeholder: 'assets/movies.png',
                    //     image: kImageBaseUrl + movie[index].posterPath),
                    Image.network(
                      kImageBaseUrl + similarMovie[index].posterPath,
                      height: size.height * 0.35,
                      width: size.width * 0.47,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 3,
                      left: 3,
                      right: 3,
                      child: Text(
                        similarMovie[index].title,
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
                            Text(
                                similarMovie[index]
                                    .voteAverage
                                    .toString()
                                    .substring(0, 3),
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
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        MovieDetailsPage(movie: similarMovie[index])));
              },
            );
          }),
    );
  }
}
