// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/helper/shimmer_effect.dart';

class ShimmerEffectList extends StatelessWidget {
  const ShimmerEffectList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ShimmerEffect(
              height: size.height * 0.35, width: size.width * 0.47);
        },
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: kDefaultPadding * 2,
          );
        },
      ),
    );
  }
}
