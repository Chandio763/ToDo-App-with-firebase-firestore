import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_with_firebase/models/todo.dart';

abstract class FirebaseUtils {
  static Stream<QuerySnapshot<Map<String, dynamic>>> get getTodoListOfDoc =>
      FirebaseFirestore.instance
          .collection('Note')
          .where('isDone', isEqualTo: false)
          .snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> get getTodoCompleteOfDoc =>
      FirebaseFirestore.instance
          .collection('Note')
          .where('isDone', isEqualTo: true)
          .snapshots();
  static void addTodo(Todo todo) {
    FirebaseFirestore.instance
        .collection('Note')
        .add(todo.toMap())
        .then((docRef) {
      print(docRef.path);
      print('-----------------------------------------docRef path');
    });
  }

  static void update({required Todo todo, required DocumentReference docRef}) {
    docRef.update(todo.toMap()).then((docRef) {
      print('-----------------------------------------update successfully');
    });
  }

  static void delete({required DocumentReference docRef}) {
    docRef.delete().then((value) {
      print('-----------------------------------------delete successfully');
    });
  }
}
