import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/routes/router.gr.dart';
import 'package:todo_app/screens/main_screen/bloc/main_screen_bloc.dart';

class MainScreen extends StatefulWidget implements AutoRouteWrapper {
  const MainScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => MainScreenBloc(),
      child: this,
    );
  }

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _AddToDoFloatActButton(),
      appBar: _MyAppBar(),
      body: const _MyBodyWidget(),
    );
  }

  AppBar _MyAppBar() {
    return AppBar(
      title: const Text("ToDos"),
      centerTitle: true,
    );
  }
}

class _AddToDoFloatActButton extends StatelessWidget {
  const _AddToDoFloatActButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<MainScreenBloc>().onPressedFloatActBut(context);
      },
      child: const Icon(Icons.add),
    );
  }
}

class _MyBodyWidget extends StatefulWidget {
  const _MyBodyWidget({super.key});

  @override
  State<_MyBodyWidget> createState() => _MyBodyWidgetState();
}

class _MyBodyWidgetState extends State<_MyBodyWidget> {
  @override
  Widget build(BuildContext context) {
    var bloc = context.read<MainScreenBloc>();
    bloc.add(FetchTodos());

    return BlocBuilder<MainScreenBloc, MainScreenState>(
      builder: (context, state) {
        if (state is MainScreenInitial) {
          return const Center(
            child: Text("You do not have any ToDos"),
          );
        } else if (state is MainScreenLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MainScreenLoaded) {
          return ToDoListWidget(
            bloc: bloc,
          );
        } else {
          return const Center(
            child: Text("Error"),
          );
        }
      },
    );
  }
}

class ToDoListWidget extends StatefulWidget {
  ToDoListWidget({super.key, required this.bloc});

  MainScreenBloc bloc;

  @override
  State<ToDoListWidget> createState() => _ToDoListWidgetState();
}

class _ToDoListWidgetState extends State<ToDoListWidget> {
  @override
  Widget build(BuildContext context) {
    List<ToDo> todos = widget.bloc.todoss;

    return ListView.builder(
      itemBuilder: ((context, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(
                  width: 20,
                ),
                Icon(Icons.edit),
              ],
            ),
          ),
          secondaryBackground: Container(
            color: Colors.red,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.delete),
                SizedBox(
                  width: 20,
                )
              ],
            ),
          ),
          onDismissed: (direction) {
            switch (direction) {
              case DismissDirection.endToStart:
                widget.bloc.add(DeleteToDo(index: index));
                break;
              case DismissDirection.startToEnd:
                asyncFunc(todos[index], index);
                break;
              default:
                null;
            }
          },
          child: ListTile(
            title: Text(
              todos[index].title.toString(),
            ),
            subtitle: Text(todos[index].text.toString()),
            trailing: Checkbox(
              value: todos[index].isDone,
              onChanged: (value) {
                ToDo todo = todos[index]; //rewrite with copyWith
                todo.isDone = value;
                widget.bloc.add(EditToDo(index: index, toDo: todo));
                setState(() {
                  todos[index].isDone = value;
                });
              },
            ),
          ),
        );
      }),
      itemCount: todos.length,
    );
  }

  void asyncFunc(ToDo todo, int index) async {
    // var result = await Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (BuildContext context) => EditToDoScreen(
    //       toDo: todo,
    //     ),
    //   ),
    // );
    var result = await context.router.push(EditToDoRoute(toDo: todo));
    setState(() {
      result is ToDo
          ? widget.bloc.add(EditToDo(index: index, toDo: result))
          : null;
    });
  }
}
