import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screen/main/tab/home/todo/w_todo_item.dart';
import '../../../../../data/memory/todo_data.dart';

class TodoList extends StatefulWidget {
  final DateTime selectedDate;

  const TodoList({required this.selectedDate, super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> with TodoDataProvider {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          //  !todoData.isLoaded.value
          //     ? const Center(
          //         child: CircularProgressIndicator(),
          //       )
          //     :
          todoData.todoList.isEmpty
              ? const Center(child: Text('할 일을 작성해보세요!'))
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: todoData.todoList
                        .where((e) =>
                            e.date.day ==
                                widget
                                    .selectedDate.day && // 선택한 날짜의 투두만 필터링합니다.
                            e.date.month == widget.selectedDate.month &&
                            e.date.year == widget.selectedDate.year)
                        .map((e) => TodoItem(
                              todo: e,
                            ))
                        .toList(),
                  ),
                ),
    );
  }
}
