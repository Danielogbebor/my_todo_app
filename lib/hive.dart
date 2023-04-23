import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToDoListDataBase {
  List toDoList = [];
  void sampleData() {
    toDoList = [
      ["Read Journal", false]
    ];
  }

  void readData() {
    toDoList = _toDoListBox.get('ToDoListBox ');
  }

  void updateData() {
    _toDoListBox.put('TODO', toDoList);
  }

  final _toDoListBox = Hive.box('ToDoListBox');
}
