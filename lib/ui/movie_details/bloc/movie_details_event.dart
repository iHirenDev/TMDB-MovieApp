// ignore_for_file: prefer_const_constructors_in_immutables

part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class SelectMovie extends MovieDetailsEvent {
  SelectMovie({required this.selectedId});

  final int selectedId;

  @override
  List<Object> get props => [selectedId];
}
