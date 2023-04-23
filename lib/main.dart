import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_todo_app/homepage.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('ToDoListBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        theme: ThemeData(primarySwatch: Colors.brown),
        home: const HomePage());
  }
}
