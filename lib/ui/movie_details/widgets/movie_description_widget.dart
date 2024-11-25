// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

import '../../../helper/constants.dart';

class MovieDescriptionWidget extends StatefulWidget {
  MovieDescriptionWidget(
      {Key? key, required this.textContent, required this.isReviews})
      : super(key: key);

  final String textContent;
  bool isExpanded = false;
  final bool isReviews;

  @override
  State<MovieDescriptionWidget> createState() => _MovieDescriptionWidgetState();
}

class _MovieDescriptionWidgetState extends State<MovieDescriptionWidget>
    with TickerProviderStateMixin<MovieDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: widget.isExpanded
                ? BoxConstraints()
                : widget.isReviews
                    ? BoxConstraints(maxHeight: size.height * 0.1)
                    : BoxConstraints(maxHeight: size.height * 0.22),
            child: Text(
              widget.textContent,
              softWrap: true,
              overflow: TextOverflow.clip,
              textAlign: TextAlign.justify,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: kTextColor),
            ),
          ),
        ),
        widget.isExpanded
            ? InkWell(
                child: Text('read less',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: kTextColor)),
                onTap: (() {
                  setState(() {
                    widget.isExpanded
                        ? widget.isExpanded = false
                        : widget.isExpanded = true;
                  });
                }),
              )
            : widget.textContent.length < 200
                ? SizedBox()
                : InkWell(
                    child: Text('read more',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kTextColor)),
                    onTap: (() {
                      setState(() {
                        widget.isExpanded
                            ? widget.isExpanded = false
                            : widget.isExpanded = true;
                      });
                    }),
                  )
      ],
    );
  }
}
