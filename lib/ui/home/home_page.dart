// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/trending_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/header.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movie_card.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movie_card_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: RepositoryProvider(
            create: (context) =>
                MovieRepository(trendingMovieAPI: TrendingMovieAPI()),
            child: BlocProvider(
              create: (context) => TrendingMovieBloc(
                  movieRepository: context.read<MovieRepository>())
                ..add(FetchTrendingMovies()),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Header(size: size),
                    Padding(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      child: Text(
                        'Trending Movies',
                        style: TextStyle(
                            color: kTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                    MovieCardList()
                  ],
                ),
              ),
            )));

    /*return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc Demo'),
        backgroundColor: Color.fromRGBO(3, 37, 65, 0.8),
      ),
      body: Container(
        color: const Color.fromRGBO(23, 118, 158, 1.0),
      ),
      //color: const Color.fromRGBO(23, 118, 158, 1.0),
    );*/

    /*return Material(
      type: MaterialType.transparency,
      child: Container(
        color: Color.fromRGBO(23, 118, 158, 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter Bloc Demo',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0),
            ),
            Text(
              'Trending Right Now',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0),
            ),
            SingleChildScrollView(
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables

                children: [
                  Container(
                    height: 200,
                    width: 150,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 200,
                    width: 150,
                    color: Colors.blueGrey,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );*/

    // return Scaffold(
    //   body: Container(
    //     margin: EdgeInsets.only(bottom: kDefaultPadding * 2.5),
    //     height: size.height * 0.2,
    //     child: Stack(
    //       children: <Widget>[
    //         Container(
    //           padding: EdgeInsets.only(
    //             left: kDefaultPadding,
    //             right: kDefaultPadding,
    //             bottom: 36 + kDefaultPadding,
    //           ),
    //           height: size.height * 0.2 - 27,
    //           decoration: BoxDecoration(
    //             color: kPrimaryColor,
    //             borderRadius: BorderRadius.only(
    //               bottomLeft: Radius.circular(20),
    //               bottomRight: Radius.circular(20),
    //             ),
    //           ),
    //           child: Column(
    //             // ignore: prefer_const_literals_to_create_immutables
    //             children: <Widget>[
    //               SizedBox(
    //                 height: 40.0,
    //               ),
    //               SizedBox(
    //                 width: size.width - kDefaultPadding * 2,
    //                 child: Text(
    //                   'Explore your favourite movies and shows',
    //                   style: TextStyle(
    //                     color: Colors.white,
    //                     fontWeight: FontWeight.bold,
    //                     fontSize: 24,
    //                   ),
    //                   maxLines: 2,
    //                   overflow: TextOverflow.ellipsis,
    //                 ),
    //               ),
    //               Spacer(),
    //             ],
    //           ),
    //         ),
    //         Positioned(
    //             bottom: 0,
    //             left: 0,
    //             right: 0,
    //             child: Container(
    //               alignment: Alignment.center,
    //               margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    //               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
    //               height: 54,
    //               decoration: BoxDecoration(
    //                   color: Colors.white,
    //                   borderRadius: BorderRadius.circular(20),
    //                   boxShadow: [
    //                     BoxShadow(
    //                         offset: Offset(0, 10),
    //                         blurRadius: 50,
    //                         color: kPrimaryColor.withOpacity(0.25))
    //                   ]),
    //               child: Row(
    //                 children: <Widget>[
    //                   Expanded(
    //                       child: TextField(
    //                     onChanged: (value) {},
    //                     decoration: InputDecoration(
    //                         hintText: 'Search Movies',
    //                         hintStyle: TextStyle(
    //                             color: kPrimaryColor.withOpacity(0.5)),
    //                         enabledBorder: InputBorder.none,
    //                         focusedBorder: InputBorder.none),
    //                   ))
    //                 ],
    //               ),
    //             ))
    //       ],
    //     ),
    //   ),
    // );
  }
}
