import 'package:flutter/material.dart';
import 'package:todo/common/common.dart';
import 'package:todo/screen/main/tab/home/todo/w_todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.holder.notifier,
      builder: (context, todoList, child) {
        return todoList.isEmpty
            ? const Text('할 일을 작성해보세요')
            : Column(
                children: todoList.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}
