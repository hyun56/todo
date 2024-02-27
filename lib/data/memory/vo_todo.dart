import 'package:flutter/foundation.dart';
import 'todo_scope.dart';

class Todo {
  final int? todoID;
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

  factory Todo.fromJson(Map<String, Object?> json) {
    if (json['todoID'] == null) {
      debugPrint('todoID cannot be null');
    }

    return Todo(
      todoID: json['todoID'] != null ? json['todoID'] as int : null,
      //todoID: json['todoID'] as int,
      todoName: json['todoName'] as String,
      date: DateTime.parse(json['date'] as String),
      isCompleted:
          json['isCompleted'] != null ? json['isCompleted'] as bool : false,
      scope: Scope.values.asNameMap()[json['scope']] ?? Scope.PUBLIC,
    );
  }

  get id => todoID;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'todoID': todoID,
      'todoName': todoName,
      'date': date.toIso8601String(), // 문자열로 변환
      'isCompleted': isCompleted,
      'scope': describeEnum(scope),
    };
  }

  @override
  String toString() {
    return 'Todo{todoID: $todoID, todoName: $todoName, date: $date, isCompleted: $isCompleted, scope: $scope}';
  }
}
