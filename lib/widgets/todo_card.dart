import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/theme/colors.dart';
import 'package:custom_check_box/custom_check_box.dart';

class TodoCard extends StatefulWidget {
  final String content;

  const TodoCard({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: IntrinsicHeight(
          child: Row(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomCheckBox(
                value: isChecked,
                onChanged: (value) => changeValue(value: value),
                checkedFillColor: mainColor,
                shouldShowBorder: isChecked ? false : true,
                borderColor: isChecked ? Colors.white : lightgrey2,
                borderRadius: 8,
                borderWidth: isChecked ? 0 : 2,
              ),
              const SizedBox(width: 5),
              _Content(content: widget.content),
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: const Color.fromARGB(250, 255, 255, 255),
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(
                                  CupertinoIcons.checkmark_alt,
                                  size: 25,
                                  color: darkMainColor,
                                ),
                                title: const Text(
                                  '완료',
                                  style: TextStyle(
                                    color: darkgrey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  // 여기에 완료 작업을 처리하는 코드를 넣으세요.
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  CupertinoIcons.pencil,
                                  color: darkMainColor,
                                  size: 23,
                                ),
                                title: const Text(
                                  '수정',
                                  style: TextStyle(
                                    color: darkgrey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  // 여기에 수정 작업을 처리하는 코드를 넣으세요.
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: const Icon(
                                  CupertinoIcons.delete,
                                  size: 20,
                                  color: Color.fromARGB(255, 202, 124, 137),
                                ),
                                title: const Text(
                                  '삭제',
                                  style: TextStyle(
                                    color: darkgrey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  // 여기에 삭제 작업을 처리하는 코드를 넣으세요.
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                icon: const Icon(CupertinoIcons.ellipsis),
                color: grey,
              ),
              const SizedBox(width: 2),

              //const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }

  void changeValue({bool? value = false}) {
    setState(() {
      isChecked = value!;
    });
  }
}

class _Content extends StatelessWidget {
  final String content;

  const _Content({
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(content),
    );
  }
}
