import 'package:flutter/material.dart';

class ToDoLIst extends StatelessWidget {
  Function(bool?)? onChanged;
  final bool value;
  final String task;

  ToDoLIst(
      {super.key,
      required this.onChanged,
      required this.value,
      required this.task});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10, top: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.brown,
        ),
        padding: EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
        child: Row(
          children: [
            Checkbox(
              value: value,
              onChanged: onChanged,
            ),
            Text(
              task,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration:
                      value ? TextDecoration.lineThrough : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
