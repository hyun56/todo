import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';
import '../../../../data/memory/todo_data.dart';
import '../../../../data/memory/vo_todo.dart';
import 'todo/w_todo_list.dart';

class CategoryBanner extends StatefulWidget {
  final String title;
  final DateTime selectedDate;

  const CategoryBanner({
    required this.title,
    required this.selectedDate,
    Key? key,
  }) : super(key: key);

  @override
  _CategoryBannerState createState() => _CategoryBannerState();
}

class _CategoryBannerState extends State<CategoryBanner> with TodoDataProvider {
  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
      text: widget.title,
      style: const TextStyle(fontSize: 19),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 35, 21, 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  color: darkMainColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () async {
                      todoData.addTodo(context, widget.selectedDate);
                    },
                    child: const Icon(
                      CupertinoIcons.plus_circle,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              const Divider(color: lightgrey2, thickness: 2.1),
              SizedBox(
                width: textPainter.width, // 텍스트의 너비만큼 Divider의 너비를 설정합니다.
                child: const Divider(color: mainColor, thickness: 2.1),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        TodoList(selectedDate: widget.selectedDate),
      ],
    );
  }
}
