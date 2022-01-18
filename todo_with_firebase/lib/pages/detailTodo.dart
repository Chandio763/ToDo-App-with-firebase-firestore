import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:todo_with_firebase/models/todo.dart';

import 'package:todo_with_firebase/util/dialogs.dart';
import 'package:todo_with_firebase/widgets/forms/update_todo.dart';

class DetailTodo extends StatelessWidget {
  const DetailTodo({Key? key, required this.todo, required this.docRef})
      : super(key: key);
  final Todo todo;
  final DocumentReference docRef;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Detail'),
        actions: [
          IconButton(
              onPressed: () =>
                  Dialogs.saveTodo(context: context, docRef: docRef),
              icon: Icon(Icons.delete))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(8.0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Time:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  todo.dateTime.toString().substring(0, 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Title:',
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(todo.title),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Discription:',
              style: Theme.of(context).textTheme.subtitle2,
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.70,
              decoration: BoxDecoration(
                color: Colors.cyan.shade100,
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(todo.discription),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Icon(Icons.edit),
        onPressed: () {
          Dialogs.updateTodo(context: context, todo: todo, docRef: docRef);
        },
      ),
    );
  }
}
