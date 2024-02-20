import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/common/util/app_keyboard_util.dart';
import 'package:todo/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:todo/common/widget/w_rounded_container.dart';
import 'package:todo/data/memory/vo_todo.dart';

import 'vo_write_todo.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  final DateTime selectedDate;
  final Todo? todoForEdit;

  WriteTodoDialog({
    super.key,
    required this.selectedDate,
    this.todoForEdit,
  });

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog>
    with AfterLayoutMixin {
  final textController = TextEditingController();
  final node = FocusNode();

  String scopeText = '전체 공개';
  Scope scope = Scope.PUBLIC;

  @override
  void initState() {
    if (widget.todoForEdit != null) {
      textController.text = widget.todoForEdit!.todoName;
      scope = widget.todoForEdit!.scope;

      if (widget.todoForEdit!.scope == Scope.PUBLIC) {
        scopeText = "전체 공개";
      } else if (widget.todoForEdit!.scope == Scope.FRIENDS) {
        scopeText = "친구 공개";
      } else {
        scopeText = "나만 보기";
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                children: [
                  const Text(
                    '할 일을 입력하세요',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: darkMainColor),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: textController,
                    focusNode: node,
                    style: const TextStyle(fontSize: 14.0),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: darkMainColor, width: 1.5),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: grey, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '공개 설정',
                        /*style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)*/
                      ),
                      GestureDetector(
                        onTap: () {
                          showCupertinoModalPopup(
                            context: context,
                            builder: (BuildContext context) =>
                                CupertinoActionSheet(
                              //title: const Text('공개 설정'),
                              actions: <Widget>[
                                CupertinoActionSheetAction(
                                  child: const Text(
                                    '전체 공개',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      scopeText = '전체 공개';
                                      scope = Scope.PUBLIC;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text(
                                    '친구 공개',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      scopeText = '친구 공개';
                                      scope = Scope.FRIENDS;
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text(
                                    '나만 보기',
                                    style: TextStyle(fontSize: 17),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      scopeText = '나만 보기';
                                      scope = Scope.PRIVATE;
                                    });
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
                        child: Row(
                          children: [
                            Text(
                              scopeText,
                              style: const TextStyle(color: darkMainColor),
                            ),
                            const SizedBox(width: 2),
                            const Icon(Icons.arrow_drop_down, size: 23)
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: OutlinedButton(
                      // onPressed: _controller.text.isEmpty ? null : _addCategory,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        foregroundColor: Colors.white,
                        backgroundColor: mainColor,
                        side: const BorderSide(color: mainColor, width: 0),
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(10.0), // 원하는 각도로 조절
                        ),
                      ),

                      child: Text(
                        isEditMode ? '수정하기' : '추가하기',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        widget.hide(
                          WriteTodoResult(
                            todoName: textController.text,
                            date: widget.selectedDate,
                            scope: scope,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool get isEditMode => widget.todoForEdit != null;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);
  }
}
