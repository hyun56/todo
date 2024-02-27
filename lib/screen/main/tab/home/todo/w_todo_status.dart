import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/common/widget/w_tap.dart';
import 'package:todo/data/memory/vo_todo.dart';

import '../../../../../data/memory/todo_data.dart';

class TodoStatusWidget extends StatelessWidget with TodoDataProvider {
  final Todo todo;

  TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () {
        todoData.changeTodoStatus(todo);
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
