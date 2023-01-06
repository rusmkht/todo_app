import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo.dart';

class AddToDoScreen extends StatefulWidget {
  const AddToDoScreen({super.key});

  @override
  State<AddToDoScreen> createState() => _AddToDoScreenState();
}

class _AddToDoScreenState extends State<AddToDoScreen> {
  late TextEditingController textEditingController;
  late TextEditingController titleEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController();
    titleEditingController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    titleEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add ToDo"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          MyTextFieldWithHeader(
            header: "Title",
            textEditingController: titleEditingController,
          ),
          MyTextFieldWithHeader(
            header: "Text",
            textEditingController: textEditingController,
          ),
          MyConfirmButton(
            func: getBackWithToDo,
          )
        ],
      ),
    );
  }

  void getBackWithToDo() {
    String formatted = DateFormat.yMd().add_jm().format(DateTime.now());

    ToDo todo = ToDo(
        title: titleEditingController.text,
        text: textEditingController.text,
        createdTime: formatted,
        isDone: false);

    Navigator.of(context).pop(todo);
  }
}

class MyTextFieldWithHeader extends StatelessWidget {
  MyTextFieldWithHeader(
      {super.key, required this.header, required this.textEditingController});

  String header;
  TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header),
          TextField(
            controller: textEditingController,
          ),
        ],
      ),
    );
  }
}

class MyConfirmButton extends StatelessWidget {
  MyConfirmButton({super.key, this.func});

  Function()? func;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: func,
            child: const Text("Добавить"),
          ),
        ],
      ),
    );
  }
}
