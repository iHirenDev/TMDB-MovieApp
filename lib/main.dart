// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_demo/app_bloc_observer.dart';
import 'package:flutter_bloc_demo/helper/constants.dart';
import 'package:flutter_bloc_demo/helper/preferences.dart';
import 'package:flutter_bloc_demo/ui/home/bloc/Theme/theme_bloc.dart';
import 'package:flutter_bloc_demo/ui/home/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Bloc Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(scaffoldBackgroundColor: kBackgroundColor),
            //theme: state.themeData,

            /*
              theme: ThemeData(
                  fontFamily: 'Source Sans Pro',
                  primaryColor: kPrimaryColor,
                  visualDensity: VisualDensity.adaptivePlatformDensity),*/
            home: HomePage(),
          );
        },
      ),
    );
  }
}
