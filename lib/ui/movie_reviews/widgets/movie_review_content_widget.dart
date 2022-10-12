import 'package:flutter/material.dart';

class MovieReviewContentWidget extends StatefulWidget {
  MovieReviewContentWidget({Key? key, required this.reviewContent})
      : super(key: key);

  final String reviewContent;
  bool isExpanded = false;

  @override
  State<MovieReviewContentWidget> createState() =>
      _MovieReviewContentWidgetState();
}

class _MovieReviewContentWidgetState extends State<MovieReviewContentWidget>
    with TickerProviderStateMixin<MovieReviewContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[],
    );
  }
}
