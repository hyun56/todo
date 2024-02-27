import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common/dart/extension/num_duration_extension.dart';
import 'package:todo/common/util/async/flutter_async.dart';

import '../../screen/main/dialog/d_message.dart';
import '../../screen/main/tab/home/todo/d_write_todo.dart';
import '../remote/result/api_error.dart';
import '../remote/todo_api.dart';
import '../remote/todo_api_test.dart'; // 백엔드 없이 테스트 용
import '../simple_result.dart';
import 'vo_todo.dart';

class TodoData extends GetxController {
  final RxList<Todo> todoList = <Todo>[].obs;
  final RxBool isLoaded = false.obs;

  final todoRepository = TodoApi.instance;

  @override
  void onInit() async {
    final remoteTodoList = await todoRepository.getTodoList();
    isLoaded.value = true;
    remoteTodoList.runIfSuccess((data) {
      todoList.addAll(data);
    });
    remoteTodoList.runIfFailure((error) {
      delay(() {
        MessageDialog(error.message).show();
      }, 100.ms);
    });
    super.onInit();
  }

  int get newId {
    return DateTime.now().millisecondsSinceEpoch;
  }

  void addTodo(BuildContext context, DateTime selectedDate) async {
    final result = await WriteTodoDialog(selectedDate: selectedDate).show();
    result?.runIfSuccess((data) async {
      final newTodo = Todo(
        //todoID: newId,
        todoName: data.todoName,
        date: data.date,
        scope: data.scope,
        isCompleted: false,
      );

      print(newTodo);

      final requestResult = await todoRepository.addTodo(newTodo);
      requestResult.runIfSuccess((data) => todoList.add(newTodo));
      requestResult.runIfFailure((error) {
        switch (error.networkErrorType) {
          case NetworkErrorType.networkConnectionError:
          //재시도를 3번
          case NetworkErrorType.serviceError:
            MessageDialog(error.message).show();
        }
      });
    });
  }

  void changeTodoStatus(Todo todo) async {
    bool nextStatus = !todo.isCompleted;

    // bool nextStatus = todo.isCompleted;

    // switch (todo.isCompleted) {
    //   case false:
    //     nextStatus = true;
    //   case true:
    //     nextStatus = false;
    // }

    final Todo todoForSave = Todo(
        todoID: todo.todoID,
        todoName: todo.todoName,
        date: todo.date,
        scope: todo.scope,
        isCompleted: nextStatus);

    final responseResult = await todoRepository.updateTodo(todoForSave);
    //print(todoForSave);
    processResponseResult(responseResult, todoForSave);
  }

  editTodo(Todo todo) async {
    final result =
        await WriteTodoDialog(selectedDate: todo.date, todoForEdit: todo)
            .show();
    final Todo todoForSave = Todo(
        todoID: todo.todoID,
        todoName: todo.todoName,
        date: todo.date,
        scope: todo.scope,
        isCompleted: todo.isCompleted);

    result?.runIfSuccess((data) async {
      todoForSave.todoName = data.todoName;
      todoForSave.scope = data.scope;

      final responseResult = await todoRepository.updateTodo(todoForSave);
      processResponseResult(responseResult, todoForSave);
    });
  }

  void processResponseResult(
      SimpleResult<void, ApiError> result, Todo updatedTodo) {
    result.runIfSuccess((data) => updateTodo(updatedTodo));
    result.runIfFailure((error) => MessageDialog(error.message).show());
  }

  void removeTodo(Todo todo) {
    todoList.remove(todo);
    todoRepository.removeTodo(todo.id);
  }

  updateTodo(Todo updatedTodo) {
    final todo =
        todoList.firstWhere((element) => element.todoID == updatedTodo.todoID);
    todo
      ..todoName = updatedTodo.todoName
      ..scope = updatedTodo.scope
      ..isCompleted = updatedTodo.isCompleted;

    todoList.refresh();
  }
}

mixin class TodoDataProvider {
  late final TodoData todoData = Get.find();
}
