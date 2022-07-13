// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/shimmer_effect.dart';

import '../../../helper/constants.dart';

class MovieDetailsShimmerEffectWidget extends StatelessWidget {
  const MovieDetailsShimmerEffectWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ShimmerEffect(
                height: size.height * 0.35,
                width: size.width * 0.35,
                cornerRadius: kDefaultPadding,
                isCircle: false,
              ),
            ),
            SizedBox(
              height: size.height * 0.35,
              width: size.width * 0.60,
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return ShimmerEffect(
                    height: 30,
                    width: size.width * 0.60,
                    cornerRadius: 5.0,
                    isCircle: false,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: kDefaultPadding / 2,
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RowShimmerWidget(),
        )
      ],
    );
  }
}

class RowShimmerWidget extends StatelessWidget {
  const RowShimmerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: [
            ShimmerEffect(
                height: 90, width: 90, cornerRadius: 0, isCircle: true),
            SizedBox(
              height: 10,
            ),
            ShimmerEffect(
                height: 30, width: 120, cornerRadius: 10, isCircle: false)
          ],
        ),
        Expanded(child: SizedBox()),
        Column(
          children: [
            ShimmerEffect(
                height: 90, width: 90, cornerRadius: 0, isCircle: true),
            SizedBox(
              height: 10,
            ),
            ShimmerEffect(
                height: 30, width: 120, cornerRadius: 10, isCircle: false)
          ],
        ),
        Expanded(child: SizedBox()),
        Column(
          children: [
            ShimmerEffect(
                height: 90, width: 90, cornerRadius: 0, isCircle: true),
            SizedBox(
              height: 10,
            ),
            ShimmerEffect(
                height: 30, width: 120, cornerRadius: 10, isCircle: false)
          ],
        ),
      ],
    );
  }
}
