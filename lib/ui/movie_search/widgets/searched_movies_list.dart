import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/repository/models/search_movie.dart';

class SearchedMovieList extends StatelessWidget {
  const SearchedMovieList({Key? key, required this.searchedMovies})
      : super(key: key);

  final List<SearchMovieResults> searchedMovies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: searchedMovies.length,
        itemBuilder: (context, index) {
          return Text(searchedMovies[index].title);
        });
  }
}
