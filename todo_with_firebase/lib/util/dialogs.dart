import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/models/todo.dart';
import 'package:todo_with_firebase/services/firebase_util.dart';
import 'package:todo_with_firebase/widgets/forms/update_todo.dart';

abstract class Dialogs {
  static void saveTodo(
      {required BuildContext context, required DocumentReference docRef}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actionsAlignment: MainAxisAlignment.spaceAround,
        elevation: 1,
        title: Text('Delete'),
        content: Text('Do you want to delete?'),
        actions: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel')),
          ElevatedButton(
              onPressed: () {
                FirebaseUtils.delete(docRef: docRef);

                Navigator.pop(context);
              },
              child: Text('Delete')),
        ],
      ),
    );
  }

  static void updateTodo(
      {required BuildContext context,
      required Todo todo,
      required DocumentReference docRef}) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(8.0),
              width: double.infinity,
              child: UpdaetTodo(docRef: docRef, todo: todo),
            ),
          );
        });
  }

  static void deleteTodo() {}
}
