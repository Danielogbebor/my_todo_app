import 'package:flutter/material.dart';
import 'package:my_todo_app/todolist.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List toDoList = [
    ['first on list', false],
    ['second on list', false]
  ];

  void checkTheBox(bool? value, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      appBar: AppBar(
        title: Text("T O   D O   L I S T"),
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () {
              print("add");
            },
            icon: Icon(Icons.add, color: Colors.white),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoLIst(
            onChanged: (value) {
              checkTheBox(value, index);
            },
            task: toDoList[index][0],
            value: toDoList[index][1],
          );
        },
      ),
    );
  }
}
