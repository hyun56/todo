import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/theme/colors.dart';
import 'w_todo_card.dart';

class CategoryRoutineBanner extends StatefulWidget {
  final String title;

  const CategoryRoutineBanner({
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryRoutineBanner> createState() => _CategoryRoutineBannerState();
}

class _CategoryRoutineBannerState extends State<CategoryRoutineBanner> {
  bool isInputVisible = false;
  final TextEditingController _controller = TextEditingController();
  List<String> todos = [];

  @override
  Widget build(BuildContext context) {
    final textSpan =
        TextSpan(text: widget.title, style: const TextStyle(fontSize: 17));
    final textPainter =
        TextPainter(text: textSpan, textDirection: TextDirection.ltr);
    textPainter.layout();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(23, 25, 21, 2),
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
              GestureDetector(
                onTap: () async {
                  final result = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor:
                            const Color.fromARGB(250, 255, 255, 255),
                        elevation: 0,

                        //title: const Text('새로운 할 일을 추가하세요'),
                        content: TextField(
                          controller: _controller,
                          style: const TextStyle(
                            color: darkgrey,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: lightgrey2,
                                width: 2,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: mainColor,
                                width: 2,
                              ),
                            ),
                            hintText: '할 일을 입력하세요',
                            hintStyle: TextStyle(
                              color: grey,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              '닫기',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkMainColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(null);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              '추가',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: darkMainColor,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(_controller.text);
                            },
                          ),
                        ],
                      );
                    },
                  );
                  if (result != null && result.trim().isNotEmpty) {
                    setState(
                      () {
                        todos.add(result);
                        _controller.clear();
                      },
                    );
                  }
                  _controller.clear();
                },
                child: const Icon(
                  CupertinoIcons.plus_circle,
                  color: grey,
                ),
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
        for (var todo in todos) TodoCard(content: todo),
      ],
    );
  }
}
