// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key, required this.height, required this.width})
      : super(key: key);

  final double height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
          // color: Colors.black.withOpacity(0.2),
          borderRadius:
              const BorderRadius.all(Radius.circular(kDefaultPadding)),
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
