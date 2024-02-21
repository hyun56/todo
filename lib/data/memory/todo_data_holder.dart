import 'package:flutter/material.dart';
import 'package:todo/data/memory/todo_data_notifier.dart';
import 'package:todo/screen/main/tab/home/todo/d_write_todo.dart';

import 'vo_todo.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    TodoDataHolder inherited =
        (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }

  void changeTodoStatus(Todo todo) async {
    switch (todo.isCompleted) {
      case false:
        todo.isCompleted = true;
      case true:
        todo.isCompleted = false;
    }
    notifier.notify();
  }

  Future<void> editTodo(Todo todo) async {
    final result =
        await WriteTodoDialog(selectedDate: todo.date, todoForEdit: todo)
            .show();

    if (result != null) {
      todo.todoName = result.todoName;
      todo.scope = result.scope;
      notifier.notify();
    }
  }

  void removeTodo(Todo todo) {
    notifier.value.remove(todo);
    notifier.notify();
  }

  void addTodo(DateTime selectedDate) async {
    final result = await WriteTodoDialog(selectedDate: selectedDate).show();
    if (result != null) {
      notifier.addTodo(
        Todo(
          todoName: result.todoName,
          date: result.date,
          scope: result.scope,
        ),
      );
    }
  }
}

extension TodoDataHolderContextExtension on BuildContext {
  TodoDataHolder get holder => TodoDataHolder._of(this);
}
