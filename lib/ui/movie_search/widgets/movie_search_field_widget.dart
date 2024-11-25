// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/ui/movie_search/bloc/movie_search_bloc.dart';
import 'package:flutter_bloc_demo/ui/movie_search/widgets/searched_movies_list.dart';

class MovieSearchFieldWidget extends StatefulWidget {
  MovieSearchFieldWidget({Key? key}) : super(key: key);

  bool isEditing = true;
  @override
  State<MovieSearchFieldWidget> createState() => _MovieSearchFieldWidgetState();
}

class _MovieSearchFieldWidgetState extends State<MovieSearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<MovieSearchBloc, MovieSearchState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.search,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(fontSize: 20, color: kTextColor),
                        onTap: () {
                          setState(() {
                            widget.isEditing = true;
                          });
                        },
                        onChanged: (query) {
                          context
                              .read<MovieSearchBloc>()
                              .add(SearchMovieEvent(query: query));
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            hintText: 'Search TMDB',
                            hintStyle: TextStyle(
                                color: kPrimaryColor.withOpacity(0.5))),
                      ),
                    ),
                    widget.isEditing
                        ? TextButton(
                            onPressed: () {
                              setState(() {
                                widget.isEditing = false;
                              });
                              //Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ))
                        : SizedBox()
                  ],
                ),
                state.status.isEmpty
                    ? SizedBox()
                    : SearchedMovieList(searchedMovies: state.searchedMovies)
                // SizedBox(
                //     height: size.height - 220,
                //     child: state.status.isEmpty
                //         ? SizedBox()
                //         : SearchedMovieList(searchedMovies: state.searchedMovies))
              ],
            ),
          ),
        );
      },
    );
  }
}
