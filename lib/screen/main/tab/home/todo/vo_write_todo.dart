enum Scope { PUBLIC, FRIENDS, PRIVATE }

class WriteTodoResult {
  final int? todoID;
  final String todoName;
  final DateTime date;
  final bool? isCompleted;
  final Scope scope;

  WriteTodoResult(
      {this.todoID,
      required this.todoName,
      required this.date,
      this.isCompleted,
      required this.scope});

  factory WriteTodoResult.fromJson(Map<String, dynamic> json) {
    return WriteTodoResult(
      todoID: json['todoID'],
      todoName: json['todoName'],
      date: DateTime.parse(json['date']),
      isCompleted: json['isCompleted'] == 1,
      scope: Scope.values[json['scope']],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'todoID': todoID,
      'todoName': todoName,
      'date': date,
      // 'date': date.toIso8601String(), // 문자열로 변환
      // 'isCompleted': isCompleted ? 1 : 0, // 정수 값으로 변환
      'scope': scope.index,
    };
  }
}
