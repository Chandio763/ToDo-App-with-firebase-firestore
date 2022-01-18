import 'dart:convert';

class Todo {
  DateTime date;
  String title;
  String discription;
  bool isDone;
  Todo({
    required this.date,
    required this.title,
    required this.discription,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date.millisecondsSinceEpoch,
      'title': title,
      'discription': discription,
      'isDone': isDone,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      title: map['title'] ?? '',
      discription: map['discription'] ?? '',
      isDone: map['isDone'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Todo(date: $date, title: $title, discription: $discription, isDone: $isDone)';
  }
}
