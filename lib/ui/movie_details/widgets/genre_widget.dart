// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/repository/models/movie_details.dart';

class GenreWidget extends StatelessWidget {
  const GenreWidget({Key? key, required this.genres}) : super(key: key);

  final List<Genres>? genres;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 40,
      width: size.width - size.width * 0.38 - 24,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres!.length,
        itemBuilder: (context, index) {
          return Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        genres![index].name!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          );
        },
      ),
    );
  }
}
