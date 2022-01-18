import 'package:flutter/material.dart';
import 'package:todo_with_firebase/pages/tabs/complete_todo.dart';
import 'package:todo_with_firebase/widgets/forms/save_todo.dart';

import 'tabs/todo_list.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    var tabs = [TodoList(), TodoComplete()];
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: tabs[selectedItem],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedItem,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.5),
        onTap: (index) {
          selectedItem = index;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined), label: 'Todo'),
          BottomNavigationBarItem(icon: Icon(Icons.done), label: 'Completed'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Icon(Icons.add),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                    title: Text(
                      'Add Todo',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    content: TodoFrom());
              },
            );
          }),
    );
  }
}
