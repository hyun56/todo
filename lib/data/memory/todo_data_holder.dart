import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/screen/main/tab/home/todo/d_write_todo.dart';

import 'vo_todo.dart';

final todoDataProvider = StateNotifierProvider<TodoDataHolder, List<Todo>>(
    (ref) => TodoDataHolder());

class TodoDataHolder extends StateNotifier<List<Todo>> {
  TodoDataHolder() : super([]);

  void changeTodoStatus(Todo todo) async {
    switch (todo.isCompleted) {
      case false:
        todo.isCompleted = true;
      case true:
        todo.isCompleted = false;
    }
    state = List.of(state);
  }

  void addTodo(DateTime selectedDate) async {
    final result = await WriteTodoDialog(selectedDate: selectedDate).show();
    if (result != null) {
      state.add(
        Todo(
          todoName: result.todoName,
          date: result.date,
          scope: result.scope,
        ),
      );
      state = List.of(state);
    }
  }

  Future<void> editTodo(Todo todo) async {
    final result =
        await WriteTodoDialog(selectedDate: todo.date, todoForEdit: todo)
            .show();

    if (result != null) {
      todo.todoName = result.todoName;
      todo.scope = result.scope;
      state = List.of(state);
    }
  }

  void removeTodo(Todo todo) {
    state.remove(todo);
    state = List.of(state);
  }
}

extension TodoListHolderProvider on WidgetRef {
  TodoDataHolder get readTodoHolder => read(todoDataProvider.notifier);
}
