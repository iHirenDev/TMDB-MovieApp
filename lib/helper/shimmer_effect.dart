// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {Key? key,
      required this.height,
      required this.width,
      required this.cornerRadius,
      required this.isCircle})
      : super(key: key);

  final double height, width, cornerRadius;
  final bool isCircle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          // color: Colors.black.withOpacity(0.2),
          // shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          borderRadius: isCircle
              ? BorderRadius.all(Radius.circular(100))
              : BorderRadius.all(Radius.circular(cornerRadius)),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(0.08),
                Colors.black.withOpacity(0.3)
              ])),
    );
  }
}

class ShimmerEffect2 extends StatelessWidget {
  const ShimmerEffect2({Key? key, required this.widget}) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return widget;
  }
}
