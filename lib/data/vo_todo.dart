enum Scope { PUBLIC, FRIENDS, PRIVATE }

class Todo {
  final int? todoID;
  final String? todoName;
  final String? date;
  final int? isCompleted;
  final Scope? scope;

  Todo(
      {required this.todoID,
      required this.todoName,
      required this.date,
      required this.isCompleted,
      required this.scope});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      todoID: json['todoID'],
      todoName: json['todoName'],
      date: json['data'],
      isCompleted: json['isCompleted'],
      scope: Scope.values[json['scope']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'todoID': todoID,
      'todoName': todoName,
      'date': date,
      'isCompleted': isCompleted,
      'scope': scope?.index,
    };
  }
}
