import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/models/todo.dart';
import 'package:todo_with_firebase/pages/detailTodo.dart';
import 'package:todo_with_firebase/services/firebase_util.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseUtils.getTodoListOfDoc,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // list of todoComplete
            var listOfTodo = snapshot.data!.docs.map((doc) {
              return Todo.fromMap(doc.data());
            }).toList();
            var listOfDoc = snapshot.data!.docs;
            return ListView.separated(
              separatorBuilder: (context, index) => Container(
                color: Colors.grey,
                margin: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 4.0,
                ),
                height: 1,
              ),
              itemCount: listOfTodo.length,
              itemBuilder: (context, index) {
                // signle todo
                var todo = listOfTodo[index];
                return ListTile(
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: Colors.cyan.shade100,
                  leading: Checkbox(
                      value: todo.isDone,
                      onChanged: (value) {
                        todo.isDone = value!;
                        listOfDoc[index]
                            .reference
                            .update(todo.toMap())
                            .then((value) {});
                        setState(() {});
                      }),
                  title: Text(todo.title),
                  subtitle: Text(todo.discription),
                  trailing: Text(todo.dateTime.toString().substring(0, 16)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailTodo(
                            todo: todo,
                            docRef: listOfDoc[index].reference,
                          ),
                        ));
                  },
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
