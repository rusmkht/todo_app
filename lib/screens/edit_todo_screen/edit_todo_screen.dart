import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/models/todo.dart';
import 'package:auto_route/auto_route.dart';

class EditToDoScreen extends StatefulWidget {
  EditToDoScreen({super.key, required this.toDo});

  ToDo? toDo;

  @override
  State<EditToDoScreen> createState() => _EditToDoScreenState();
}

class _EditToDoScreenState extends State<EditToDoScreen> {
  late TextEditingController textEditingController;
  late TextEditingController titleEditingController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController = TextEditingController(text: widget.toDo?.text);
    titleEditingController = TextEditingController(text: widget.toDo?.title);
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
        title: const Text("Edit ToDo"),
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
          myCheckBox(),
          MyConfirmButton(
            func: getBackWithToDo,
          )
        ],
      ),
    );
  }

  Widget myCheckBox() {
    return Row(
      children: [
        SizedBox(
          width: 15,
        ),
        Text("Status "),
        Checkbox(
            value: widget.toDo?.isDone,
            onChanged: (value) {
              setState(() {
                widget.toDo?.isDone = value;
              });
            }),
      ],
    );
  }

  void getBackWithToDo() {
    String formatted = DateFormat.yMd().add_jm().format(DateTime.now());

    ToDo todo = ToDo(
        title: titleEditingController.text,
        text: textEditingController.text,
        createdTime: formatted,
        isDone: widget.toDo?.isDone);

    // Navigator.of(context).pop(todo);
    context.router.pop(todo);
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
            child: const Text("Изменить"),
          ),
        ],
      ),
    );
  }
}
