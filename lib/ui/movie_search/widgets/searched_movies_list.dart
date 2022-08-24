// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/repository/models/search_movie.dart';
import 'package:flutter_bloc_demo/ui/movie_details/movie_details_page.dart';
import 'package:intl/intl.dart';

class SearchedMovieList extends StatelessWidget {
  const SearchedMovieList({Key? key, required this.searchedMovies})
      : super(key: key);

  final List<SearchMovieResults> searchedMovies;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView.builder(
        itemCount: searchedMovies.length,
        itemBuilder: (context, index) {
          return InkWell(
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.network(
                    kImageBaseUrl + searchedMovies[index].posterPath,
                    height: 100,
                    width: 90,
                    fit: BoxFit.fill,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                              maxHeight: 50, maxWidth: size.width - 130),
                          child: Text(
                            searchedMovies[index].title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                            'Release Date: ' +
                                _stringToDate(
                                  searchedMovies[index].releaseDate,
                                ),
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        Text(
                            'Ratings: ' +
                                searchedMovies[index].voteAverage.toString() +
                                '/10',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MovieDetailsPage(
                        id: searchedMovies[index].id,
                        movieTitle: searchedMovies[index].title,
                      )));
            },
          );
        },
        // separatorBuilder: (context, index) {
        //   return Divider();
        // },
      ),
    );
  }
}

String _stringToDate(String date) {
  var localDate = DateTime.parse(date).toLocal();
  var inputFormat = DateFormat('yyyy-MM-dd');
  var inputDate = inputFormat.parse(localDate.toString());
  var outputFormat = DateFormat('dd/MM/yyyy');
  var outputDate = outputFormat.format(inputDate);

  return outputDate.toString();
}
