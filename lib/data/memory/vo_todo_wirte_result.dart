import 'todo_scope.dart';

class TodoWriteResult {
  TodoWriteResult({
    required this.todoName,
    required this.date,
    required this.scope,
  });

  String todoName;
  DateTime date;
  Scope scope;
}
