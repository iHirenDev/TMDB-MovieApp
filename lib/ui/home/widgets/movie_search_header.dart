// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/ui/movie_search/movie_search_page.dart';
import 'package:page_transition/page_transition.dart';

class MovieSearchHeader extends StatelessWidget {
  const MovieSearchHeader({Key? key, required this.size}) : super(key: key);

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: kDefaultPadding),
      height: size.height * 0.2,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: kDefaultPadding,
              right: kDefaultPadding,
              bottom: 36 + kDefaultPadding,
            ),
            height: size.height * 0.2 - 27,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: <Widget>[
                Text(
                  'Explore your favourite movies and shows',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 10),
                          blurRadius: 50,
                          color: kPrimaryColor.withOpacity(0.25))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      showCursor: false,
                      onTap: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                child: MovieSearchPage(),
                                type: PageTransitionType.size,
                                alignment: Alignment.bottomCenter,
                                reverseDuration: Duration(milliseconds: 200),
                                duration: Duration(milliseconds: 200)));
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => MovieSearchPage()));
                      },
                      decoration: InputDecoration(
                          hintText: 'Search Movies and TV shows',
                          hintStyle:
                              TextStyle(color: kPrimaryColor.withOpacity(0.5)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
