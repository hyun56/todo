import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:todo/common/common.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/common/widget/w_rounded_container.dart';
import 'package:todo/data/memory/vo_todo.dart';
import 'package:velocity_x/velocity_x.dart';

import 'w_todo_status.dart';

class TodoItem extends ConsumerWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              ref.readTodoHolder.editTodo(todo);
                              Navigator.pop(context);
                            },
                          ),
                          CupertinoActionSheetAction(
                            child: const Text(
                              '삭제',
                              style: TextStyle(fontSize: 17),
                            ),
                            onPressed: () {
                              ref.readTodoHolder.removeTodo(todo);
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
