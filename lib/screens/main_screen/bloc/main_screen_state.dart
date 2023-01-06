part of 'main_screen_bloc.dart';

abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class MainScreenLoading extends MainScreenState {}

class MainScreenLoaded extends MainScreenState {}

class MainScreenLoadedEmpty extends MainScreenState {}

class MainScreenError extends MainScreenState {}
