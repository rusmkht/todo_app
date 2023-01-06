import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/models/todo.dart';

class ToDosRepository {
  late SharedPreferences sharedPreferences;

  ToDosRepository() {}

  Future<void> initialize() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //WRITE TODOS IN SHARED PREFERENCES
  Future<void> writeToDosSP(List<ToDo> todos) async {
    List<String> storage = [];

    try {
      todos.forEach((element) {
        storage.add(json.encode(element.toJson()));
        print(json.encode(element.toJson()));
      });

      print(storage.toString());

      await sharedPreferences.setStringList("todos", storage);
    } catch (e) {
      throw e.toString();
    }
  }

  //ADD TODO
  Future<void> addToDo(ToDo todo) async {
    List<ToDo>? todos = await getToDos();

    todos.add(todo);

    print(todos.length);

    await writeToDosSP(todos);
  }

  //EDIT TODO
  Future<void> editToDo(int index, ToDo toDo) async {
    List<ToDo>? todos = await getToDos();

    todos[index] = toDo;

    await writeToDosSP(todos);
  }

  //DELETE TODO
  Future<void> deleteToDo(int index) async {
    List<ToDo>? todos = await getToDos();

    todos.removeAt(index);

    await writeToDosSP(todos);
  }

  //GET TODO
  Future<List<ToDo>> getToDos() async {
    await initialize();

    List<ToDo> todos = [];

    try {
      List<String>? storage = sharedPreferences.getStringList("todos");

      if (storage != null) {
        storage.forEach((element) {
          print(element.toString());
          todos.add(
            ToDo.fromJson(jsonDecode(element)),
          );
        });
      }
    } catch (e) {
      throw e.toString();
    }

    return todos;
  }
}
