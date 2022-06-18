// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class MovieDescriptionWidget extends StatefulWidget {
  MovieDescriptionWidget({Key? key, required this.description})
      : super(key: key);

  final String description;
  bool isExpanded = false;

  @override
  State<MovieDescriptionWidget> createState() => _MovieDescriptionWidgetState();
}

class _MovieDescriptionWidgetState extends State<MovieDescriptionWidget>
    with TickerProviderStateMixin<MovieDescriptionWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        AnimatedSize(
          duration: Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: widget.isExpanded
                ? BoxConstraints()
                : BoxConstraints(maxHeight: size.height * 0.22),
            child: Text(
              widget.description,
              softWrap: true,
              overflow: TextOverflow.clip,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        widget.isExpanded
            ? TextButton(
                onPressed: () => setState(() => widget.isExpanded = false),
                child: Text('read less <<<'))
            : widget.description.length < 200
                ? SizedBox()
                : TextButton(
                    onPressed: () => setState(() => widget.isExpanded = true),
                    child: Text('read more >>>'))
      ],
    );
  }
}
