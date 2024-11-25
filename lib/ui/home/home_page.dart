// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/helper/preferences.dart';
import 'package:flutter_bloc_demo/helper/themes.dart';
import 'package:flutter_bloc_demo/repository/apiservices/trending_movie_api.dart';
import 'package:flutter_bloc_demo/repository/models/trending_movie.dart';
import 'package:flutter_bloc_demo/repository/movie_repository.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/TrendingMovies/trending_movie_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/header.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movie_card_list.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/movie_search_header.dart';
import 'package:flutter_bloc_demo/ui/home/widgets/upcoming_movie_list.dart';

import 'bloc/Theme/theme_bloc.dart';
import 'bloc/UpcomingMovies/upcoming_movie_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadThemeFromPreferences();
  }

  _loadThemeFromPreferences() async {
    context
        .read<ThemeBloc>()
        .add(SelectTheme(appThemes: Preferences.getTheme()!));
  }

  _changeTheme(bool darkTheme) async {
    AppThemes selectedTheme = darkTheme ? AppThemes.light : AppThemes.dark;
    context.read<ThemeBloc>().add(SelectTheme(appThemes: selectedTheme));
    Preferences.saveTheme(selectedTheme);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          elevation: 0.0,

          /*
          Theme switch...
          actions: [
            Switch(
                value: Preferences.getTheme() == AppThemes.light,
                onChanged: (val) async {
                  _changeTheme(val);
                })
          ],
          */
        ),
        body: RepositoryProvider(
            create: (context) => MovieRepository(
                  trendingMovieAPI: TrendingMovieAPI(),
                ),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => TrendingMovieBloc(
                      movieRepository: context.read<MovieRepository>())
                    ..add(FetchTrendingMovies()),
                ),
                BlocProvider(
                  create: (context) => UpcomingMovieBloc(
                      movieRepository: context.read<MovieRepository>())
                    ..add(FetchUpcomingMovie()),
                ),
              ],
              child: SafeArea(
                child: Column(
                  children: [
                    MovieSearchHeader(size: size),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //Header(size: size),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: kDefaultPadding),
                                  child: Text(
                                    'Trending Movies',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28,
                                      color: Colors.white,
                                      // color: Theme.of(context)
                                      //     .textTheme
                                      //     .bodyText2
                                      //     ?.color
                                    ),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Show All',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.white,
                                        // color: Theme.of(context)
                                        //     .textTheme
                                        //     .bodyText2
                                        //     ?.color
                                      ),
                                    ),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                            MovieCardList(),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: kDefaultPadding),
                                  child: Text(
                                    'Popular Movies',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 28),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                InkWell(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Show All',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 24),
                                    ),
                                  ),
                                  onTap: () {},
                                )
                              ],
                            ),
                            UpcomingMovieList()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
