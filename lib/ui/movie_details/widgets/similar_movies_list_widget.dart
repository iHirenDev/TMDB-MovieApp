// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/ui/movie_details/movie_details_page.dart';

import '../../../repository/models/similar_movies.dart';

class SimilarMoviesListWidget extends StatelessWidget {
  const SimilarMoviesListWidget({Key? key, required this.similarMovie})
      : super(key: key);

  final List<SimilarMoviesResults> similarMovie;
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
                height: size.height * 0.37,
                margin: EdgeInsets.only(
                    left: kDefaultPadding,
                    top: kDefaultPadding / 2,
                    bottom: kDefaultPadding * 0.8,
                    right: kDefaultPadding),
                decoration: BoxDecoration(
                    border: Border.all(color: kPrimaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: FadeInImage.assetNetwork(
                          height: size.height * 0.35,
                          width: size.width * 0.47,
                          fit: BoxFit.cover,
                          placeholder: 'assets/tmdb2.png',
                          image:
                              kImageBaseUrl + similarMovie[index].posterPath!),
                    ),

                    // Image.network(
                    //   kImageBaseUrl + movie[index].posterPath,
                    //   height: size.height * 0.35,
                    //   width: size.width * 0.47,
                    //   fit: BoxFit.cover,
                    // ),
                    Positioned(
                      bottom: 3,
                      left: 3,
                      right: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              kBackgroundColor.withOpacity(0.4),
                              kBackgroundColor.withOpacity(0.9),
                              kBackgroundColor.withOpacity(0.4),
                            ],
                          ),
                        ),
                        child: Text(
                          similarMovie[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: CircleAvatar(
                        radius: 24,
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
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  //color: Colors.white
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MovieDetailsPage(
                          id: similarMovie[index].id!,
                          movieTitle: similarMovie[index].title!,
                          ratings: similarMovie[index].voteAverage!,
                        )));
              },
            );
          }),
    );
  }
}
