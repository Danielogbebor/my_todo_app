import 'package:flutter/material.dart';

class DialogInput extends StatelessWidget {
  final controller;
  VoidCallback save;
  VoidCallback cancel;

  DialogInput(
      {super.key,
      required this.controller,
      required this.save,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.brown.shade300,
      content: Container(
        height: 110,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'New Task',
                  prefixIcon: Icon(Icons.list),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: const OutlineInputBorder()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  onPressed: save,
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.brown)),
                ),
                SizedBox(width: 8),
                OutlinedButton(
                    onPressed: cancel,
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.brown)),
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),

        // width: 250,
      ),
    );
  }
}
