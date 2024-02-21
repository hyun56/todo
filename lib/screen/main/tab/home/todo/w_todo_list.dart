import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/common/common.dart';
import 'package:todo/screen/main/tab/home/todo/w_todo_item.dart';

class TodoList extends StatelessWidget with TodoDataProvider {
  TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => todoData.todoList.isEmpty
          ? const Text('할 일을 작성해보세요')
          : Column(
              children: todoData.todoList.map((e) => TodoItem(e)).toList(),
            ),
    );
  }
}
