import 'package:flutter/material.dart';

class MovieReviewsHeaderWidget extends StatelessWidget {
  const MovieReviewsHeaderWidget({Key? key, required this.ratings})
      : super(key: key);

  final String ratings;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Text(ratings)],
    );
  }
}
