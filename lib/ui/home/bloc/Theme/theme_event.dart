part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class SelectTheme extends ThemeEvent {
  final AppThemes appThemes;

  const SelectTheme({required this.appThemes});

  @override
  List<Object> get props => [];
}
