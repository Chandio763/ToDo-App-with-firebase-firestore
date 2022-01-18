import 'package:flutter/material.dart';
import 'package:todo_with_firebase/models/todo.dart';
import 'package:todo_with_firebase/services/firebase_util.dart';

class TodoFrom extends StatelessWidget {
  const TodoFrom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    var titleTextEdittingController = TextEditingController();
    var discriptionTextEdittingController = TextEditingController();
    return Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleTextEdittingController,
              maxLines: 1,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Title'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'title must not be null';
                }
              },
            ),
            TextFormField(
              controller: discriptionTextEdittingController,
              maxLines: 3,
              decoration: InputDecoration(
                  border: UnderlineInputBorder(), labelText: 'Discription'),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final isValidate = _formKey.currentState!.validate();
                  if (isValidate) {
                    FirebaseUtils.addTodo(Todo(
                        dateTime: DateTime.now(),
                        title: titleTextEdittingController.text,
                        discription: discriptionTextEdittingController.text));
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
              ),
            )
          ],
        ));
  }
}
