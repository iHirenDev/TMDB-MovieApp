// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/repository/models/upcoming_movie.dart';
import 'package:flutter_bloc_demo/ui/movie_details/movie_details_page.dart';

import '../../../helper/constants.dart';
import '../../../repository/models/trending_movie.dart';

class TestList extends StatelessWidget {
  const TestList({Key? key, required this.movie, required this.size})
      : super(key: key);

  final List<UpcomingMovieResult> movie;
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
                        height: size.height * 0.35,
                        width: size.width * 0.47,
                        fit: BoxFit.fill,
                        placeholder: 'assets/movies.png',
                        image: kImageBaseUrl + movie[index].posterPath!),
                    Positioned(
                      bottom: 3,
                      left: 3,
                      right: 3,
                      child: Text(
                        movie[index].title!,
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
              ),
              onTap: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         MovieDetailsPage(movie: movie[index])));
              },
            );
          }),
    );
  }
}
/* return state.status.isSuceess ? 
                  Center(child: Text('data')) : state.status.isLoading ? Center(child: CircularProgressIndicator()) : state.status.isFailure ? Center(child: Text('Failed to load movie details')) : SizedBox();  */