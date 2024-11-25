// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/repository/models/upcoming_movie.dart';
import 'package:flutter_bloc_demo/ui/movie_details/movie_details_page.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../helper/constants.dart';
import '../../../repository/models/trending_movie.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({Key? key, required this.movie, required this.size})
      : super(key: key);

  final List<TredndingMovieResult> movie;

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.37,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: movie.length,
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
                          image: kImageBaseUrl + movie[index].posterPath),
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
                          movie[index].title,
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
                                movie[index]
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
                          id: movie[index].id,
                          movieTitle: movie[index].title,
                          ratings: movie[index].voteAverage,
                        )));
              },
            );
          }),
    );
  }
}
