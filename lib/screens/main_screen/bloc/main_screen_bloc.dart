import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/data/repository.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/screens/add_todo_screen/add_todo_screen.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  late ToDosRepository _toDosRepository;

  late List<ToDo> todoss;

  MainScreenBloc() : super(MainScreenInitial()) {
    _toDosRepository = ToDosRepository();
    on<FetchTodos>(fetchData);
    on<AddToDo>(addToDo);
    on<EditToDo>(editToDo);
    on<DeleteToDo>(deleteToDo);
  }

  void fetchData(MainScreenEvent event, Emitter<MainScreenState> emit) async {
    emit(MainScreenLoading());

    todoss = await _toDosRepository.getToDos();

    if (todoss.isEmpty) {
      emit(MainScreenInitial());
    } else {
      emit(MainScreenLoaded());
    }
  }

  void addToDo(AddToDo event, Emitter<MainScreenState> emit) async {
    await _toDosRepository.addToDo(event.toDo);
    todoss.add(event.toDo);
    emit(MainScreenLoaded());
  }

  void editToDo(EditToDo event, Emitter<MainScreenState> emit) async {
    await _toDosRepository.editToDo(event.index, event.toDo);
    todoss[event.index] = event.toDo;
    emit(MainScreenLoaded());
  }

  void deleteToDo(DeleteToDo event, Emitter<MainScreenState> emit) async {
    await _toDosRepository.deleteToDo(event.index);
    todoss.removeAt(event.index);
    emit(MainScreenLoaded());
  }

  Future<void> onPressedFloatActBut(BuildContext context) async {
    var result = await Navigator.of(context).push(
      MaterialPageRoute<ToDo?>(
        builder: (BuildContext context) => const AddToDoScreen(),
      ),
    );

    if (result is ToDo) {
      context.read<MainScreenBloc>().add(AddToDo(toDo: result));
    }
  }
}
