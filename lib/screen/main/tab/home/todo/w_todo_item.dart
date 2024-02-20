import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/common/widget/w_rounded_container.dart';
import 'package:todo/data/memory/todo_data_holder.dart';
import 'package:todo/data/memory/vo_todo.dart';
import 'package:velocity_x/velocity_x.dart';

import 'w_todo_status.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(todo.date);

    return RoundedContainer(
      child: Column(
        children: [
          Text(formattedDate),
          Row(
            children: [
              TodoStatusWidget(todo),
              Expanded(child: todo.todoName.text.make()),
              IconButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => CupertinoActionSheet(
                        actions: <Widget>[
                          CupertinoActionSheetAction(
                            child: const Text(
                              '완료',
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text(
                              '수정',
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () async {
                              await context.holder.editTodo(todo);
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text(
                              '삭제',
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () {
                              context.holder.removeTodo(todo);
                              Navigator.pop(context);
                            },
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          child: const Text(
                            '취소',
                            style: TextStyle(fontSize: 17),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.ellipsis, color: grey)),
            ],
          )
        ],
      ),
    );
  }
}
