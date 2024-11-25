// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/repository/models/movie_details.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movies_list.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/genre_widget.dart';
import 'package:flutter_bloc_demo/ui/movie_details/widgets/movie_description_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../helper/constants.dart';

class MovieDetailsWidget extends StatelessWidget {
  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);

  final MovieDetails movie;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        kImageBaseUrl + movie.posterPath!,
                        height: size.height * 0.35,
                        width: size.width * 0.35,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GenreWidget(genres: movie.genres),
                            SizedBox(
                              width: size.width - size.width * 0.38 - 24,
                              child: MovieDescriptionWidget(
                                  textContent: movie.overview!,
                                  isReviews: false),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.yellow[900],
                            size: 40,
                          ),
                          Text(
                              movie.voteAverage.toString().substring(0, 3) +
                                  '/10',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor)),
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_month_outlined,
                            color: kPrimaryColor,
                            size: 40,
                          ),
                          Text(_stringToDate(movie.releaseDate!),
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: kTextColor))
                        ],
                      ),
                      Expanded(child: SizedBox()),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.watch_later_outlined,
                            color: kPrimaryColor,
                            size: 40,
                          ),
                          Text(
                            _minutesToHour(movie.runtime!),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: kTextColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _stringToDate(String date) {
    var localDate = DateTime.parse(date).toLocal();
    var inputFormat = DateFormat('yyyy-MM-dd');
    var inputDate = inputFormat.parse(localDate.toString());
    var outputFormat = DateFormat('dd/MM/yyyy');
    var outputDate = outputFormat.format(inputDate);

    return outputDate.toString();
  }

  String _minutesToHour(int min) {
    final int hour = min ~/ 60;
    final int minutes = min % 60;
    return '$hour hrs $minutes min';
  }
}
