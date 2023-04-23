import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_todo_app/todolist.dart';

import 'dialoginputtext.dart';
import 'hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toDoListBox = Hive.box('ToDoListBox');
  final _controller = TextEditingController();
  final ToDoListDataBase db = ToDoListDataBase();
  @override
  void initState() {
    if (_toDoListBox.get('ToDoListBox') == null) {
      db.sampleData();
    } else {
      db.readData();
    }
    super.initState();
  }

  void checkTheBox(bool? value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void createTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogInput(
            cancel: () {
              Navigator.of(context).pop();
            },
            controller: _controller,
            save: saveToToDoList,
          );
        });
  }

  saveToToDoList() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      appBar: AppBar(
        title: const Text("T O   D O   L I S T"),
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () {
              createTask();
            },
            icon: Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoLIst(
            deleteTask: (context) {
              deleteTask(index);
            },
            onChanged: (value) {
              checkTheBox(value, index);
            },
            task: db.toDoList[index][0],
            value: db.toDoList[index][1],
          );
        },
      ),
    );
  }
}
