import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/models/todo.dart';
import 'package:todo_with_firebase/services/firebase_util.dart';

class UpdaetTodo extends StatefulWidget {
  const UpdaetTodo({Key? key, required this.docRef, required this.todo})
      : super(key: key);
  final Todo todo;
  final DocumentReference docRef;
  @override
  State<UpdaetTodo> createState() => _UpdaetTodoState();
}

class _UpdaetTodoState extends State<UpdaetTodo> {
  @override
  Widget build(BuildContext context) {
    TextEditingController titleTextController =
        TextEditingController(text: widget.todo.title);
    TextEditingController discriptionTextController =
        TextEditingController(text: widget.todo.discription);
    var _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Title:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  width: 4,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    controller: titleTextController,
                    maxLines: 1,
                    decoration: InputDecoration(
                      filled: false,
                      fillColor: Colors.cyan,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Title must not be empty';
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              'Discription:',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            SizedBox(
              height: 4.0,
            ),

            TextFormField(
              controller: discriptionTextController,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.cyan.shade100,
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(
              height: 4.0,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel')),
                ElevatedButton(
                    onPressed: () {
                      var isValid = _formKey.currentState!.validate();
                      if (isValid) {
                        FirebaseUtils.update(
                            todo: Todo(
                                dateTime: DateTime.now(),
                                title: titleTextController.text,
                                discription: discriptionTextController.text),
                            docRef: widget.docRef);
                        setState(() {});
                        widget.todo.title = titleTextController.text;
                        widget.todo.discription =
                            discriptionTextController.text;
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Update')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
