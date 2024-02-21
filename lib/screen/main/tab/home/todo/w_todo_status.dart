import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/common/widget/w_tap.dart';
import 'package:todo/data/memory/todo_data_holder.dart';
import 'package:todo/data/memory/vo_todo.dart';

class TodoStatusWidget extends ConsumerWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Tap(
      onTap: () {
        ref.readTodoHolder.changeTodoStatus(todo);
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: (todo.isCompleted)
            ? Checkbox(
                value: true,
                onChanged: null,
                fillColor:
                    MaterialStateColor.resolveWith((states) => mainColor),
              )
            : const Checkbox(
                value: false,
                onChanged: null,
              ),
      ),
    );
  }
}
