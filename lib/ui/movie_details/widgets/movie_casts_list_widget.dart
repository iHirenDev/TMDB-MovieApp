// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/models/movie_casts.dart';

class MovieCastsListWidget extends StatelessWidget {
  const MovieCastsListWidget({Key? key, required this.movieCasts})
      : super(key: key);

  final List<Cast> movieCasts;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movieCasts.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  //Text(kImageBaseUrl + movieCasts[index].profilePath!),
                  CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      foregroundImage: movieCasts[index].profilePath == null
                          ? NetworkImage(
                              'https://cdn4.iconfinder.com/data/icons/evil-icons-user-interface/64/avatar-512.png')
                          : NetworkImage(
                              kImageBaseUrl + movieCasts[index].profilePath!)),
                  Text(
                    movieCasts[index].name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
