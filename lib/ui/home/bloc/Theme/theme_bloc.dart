import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_demo/helper/themes.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(themeData: Themes.appThemeData[AppThemes.light])) {
    on<SelectTheme>(_selectTheme);
  }

  void _selectTheme(SelectTheme event, Emitter<ThemeState> emit) async {
    emit(ThemeState(themeData: Themes.appThemeData[event.appThemes]));
  }
}
