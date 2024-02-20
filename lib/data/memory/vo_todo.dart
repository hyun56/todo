import 'package:todo/screen/main/tab/home/todo/vo_write_todo.dart';

class Todo {
  int? todoID;
  String todoName;
  DateTime date;
  bool isCompleted;
  Scope scope;

  Todo(
      {this.todoID,
      required this.todoName,
      required this.date,
      this.isCompleted = false,
      required this.scope});
}
