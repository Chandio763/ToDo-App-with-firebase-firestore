import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_with_firebase/models/todo.dart';
import 'package:todo_with_firebase/pages/detailTodo.dart';
import 'package:todo_with_firebase/services/firebase_util.dart';

class TodoComplete extends StatefulWidget {
  const TodoComplete({Key? key}) : super(key: key);

  @override
  State<TodoComplete> createState() => _TodoCompleteState();
}

class _TodoCompleteState extends State<TodoComplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseUtils.getTodoCompleteOfDoc,
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
                  trailing: ElevatedButton(
                      onPressed: () {
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
                                    FirebaseUtils.delete(
                                        docRef: listOfDoc[index].reference);

                                    Navigator.pop(context);
                                  },
                                  child: Text('Delete')),
                            ],
                          ),
                        );
                      },
                      child: Text('Delete')),
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
