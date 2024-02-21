import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/common/common.dart';
import 'package:todo/screen/main/tab/home/todo/w_todo_item.dart';

class TodoList extends ConsumerWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoDataProvider);

    return todoList.isEmpty
        ? const Text('할 일을 작성해보세요')
        : Column(
            children: todoList.map((e) => TodoItem(e)).toList(),
          );
  }
}
