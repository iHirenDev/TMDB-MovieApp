// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';

class MovieReviewsPage extends StatelessWidget {
  const MovieReviewsPage({Key? key, required this.movieId}) : super(key: key);

  final int movieId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Reviews',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: <Widget>[Text('Reviews go here for $movieId')],
      ),
    );
  }
}
