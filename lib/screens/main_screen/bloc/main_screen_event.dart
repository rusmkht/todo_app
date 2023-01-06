part of 'main_screen_bloc.dart';

abstract class MainScreenEvent extends Equatable {}

class FetchTodos extends MainScreenEvent {
  FetchTodos();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class AddToDo extends MainScreenEvent {
  ToDo toDo;

  AddToDo({required this.toDo});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class EditToDo extends MainScreenEvent {
  int index;
  ToDo toDo;

  EditToDo({required this.index, required this.toDo});

  @override
  List<Object?> get props => throw UnimplementedError();
}

class DeleteToDo extends MainScreenEvent {
  int index;

  DeleteToDo({required this.index});

  @override
  List<Object?> get props => throw UnimplementedError();
}
