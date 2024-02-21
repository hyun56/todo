import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screen/main/tab/home/todo/d_write_todo.dart';

import 'vo_todo.dart';

class TodoDataHolder extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;

  void changeTodoStatus(Todo todo) async {
    switch (todo.isCompleted) {
      case false:
        todo.isCompleted = true;
      case true:
        todo.isCompleted = false;
    }
    todoList.refresh();
  }

  void addTodo(DateTime selectedDate) async {
    final result = await WriteTodoDialog(selectedDate: selectedDate).show();
    if (result != null) {
      todoList.add(
        Todo(
          todoName: result.todoName,
          date: result.date,
          scope: result.scope,
        ),
      );
    }
  }

  Future<void> editTodo(Todo todo) async {
    final result =
        await WriteTodoDialog(selectedDate: todo.date, todoForEdit: todo)
            .show();

    if (result != null) {
      todo.todoName = result.todoName;
      todo.scope = result.scope;
      todoList.refresh();
    }
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoDataHolder todoData = Get.find();
}
