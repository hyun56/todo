import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';
import 'w_todo_card.dart';

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

class _CategoryBannerState extends State<CategoryBanner> {
  bool isInputVisible = false;
  final TextEditingController _controller = TextEditingController();
  List<String> todos = [];
  Map<DateTime, List<String>> todosByDate = {};

  String editingTitle = '';
  bool isEditing = false;

  bool isTabBarVisible = true;

  @override
  Widget build(BuildContext context) {
    final textSpan = TextSpan(
      text: isEditing ? editingTitle : widget.title,
      style: const TextStyle(fontSize: 17),
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
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
                isEditing ? editingTitle : widget.title,
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
                      final result = await showDialog<String>(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: backgroundColor,
                            elevation: 0,
                            titlePadding:
                                const EdgeInsets.fromLTRB(0, 27, 0, 5),
                            title: const Text(
                              '새로운 할 일',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: darkMainColor2,
                                fontSize: 17.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
                                    color: darkMainColor2,
                                    fontSize: 15.5,
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
                                    color: darkMainColor2,
                                    fontSize: 15.5,
                                  ),
                                ),
                                onPressed: () {
                                  setState(() {
                                    final todo = _controller.text;
                                    if (todosByDate[widget.selectedDate] ==
                                        null) {
                                      todosByDate[widget.selectedDate] = [todo];
                                    } else {
                                      todosByDate[widget.selectedDate]!
                                          .add(todo);
                                    }
                                    _controller.clear();
                                  });
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
                  const SizedBox(width: 3),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints.tightFor(width: 30, height: 32),
                    child: PopupMenuButton<String>(
                      elevation: 2,
                      //color: backgrounColor,
                      surfaceTintColor:
                          const Color.fromARGB(255, 195, 175, 251),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      icon: const Icon(CupertinoIcons.ellipsis_circle,
                          color: grey),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<String>>[
                        const PopupMenuItem<String>(
                          value: 'edit',
                          child: Text(
                            '카테고리 수정',
                            style: TextStyle(
                              color: darkgrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const PopupMenuItem<String>(
                          value: 'public',
                          child: Text(
                            '공개 설정',
                            style: TextStyle(
                              color: darkgrey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                      onSelected: (String value) {
                        if (value == 'edit') {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: backgroundColor,
                                elevation: 0,
                                titlePadding:
                                    const EdgeInsets.fromLTRB(0, 27, 0, 5),
                                title: const Text(
                                  '카테고리 수정',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: darkMainColor2,
                                    fontSize: 17.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                content: TextField(
                                  controller: _controller,
                                  style: const TextStyle(
                                    color: darkgrey,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  decoration: const InputDecoration(
                                    hintText: '변경할 이름을 입력하세요',
                                    hintStyle: TextStyle(
                                      color: grey,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.bold,
                                    ),
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
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      '취소',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: darkMainColor2,
                                        fontSize: 15.5,
                                      ),
                                    ),
                                    onPressed: () =>
                                        Navigator.pop(context, 'cancel'),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      '확인',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: darkMainColor2,
                                        fontSize: 15.5,
                                      ),
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        editingTitle = _controller.text;
                                        isEditing = true;
                                      });
                                      Navigator.pop(context, 'ok');
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else if (value == 'public') {
                          setState(() {
                            isTabBarVisible = false; // 탭바를 숨깁니다.
                          });

                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return const PublicSettingModal();
                            },
                            backgroundColor:
                                const Color.fromARGB(250, 255, 255, 255),
                          ).then((_) {
                            setState(() {
                              isTabBarVisible = true; // 모달이 닫힐 때 탭바를 다시 표시합니다.
                            });
                          });
                        }
                      },
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
        for (var todo in (todosByDate[widget.selectedDate] ?? []))
          TodoCard(content: todo),
      ],
    );
  }
}

class PublicSettingModal extends StatefulWidget {
  const PublicSettingModal({super.key});

  @override
  _PublicSettingModalState createState() => _PublicSettingModalState();
}

class _PublicSettingModalState extends State<PublicSettingModal> {
  String selectedPublicSetting = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 6, 0, 20),
              child: Text(
                '공개 설정',
                style: TextStyle(
                  color: darkMainColor2,
                  fontSize: 17.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RadioListTile<String>(
              activeColor: darkMainColor,
              title: const Text(
                '전체공개',
                style: TextStyle(
                  color: darkgrey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: 'public',
              groupValue: selectedPublicSetting,
              onChanged: (String? value) {
                setState(() {
                  selectedPublicSetting = value!;
                });
              },
            ),
            RadioListTile<String>(
              activeColor: darkMainColor,
              title: const Text(
                '친구공개',
                style: TextStyle(
                  color: darkgrey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: 'friends',
              groupValue: selectedPublicSetting,
              onChanged: (String? value) {
                setState(() {
                  selectedPublicSetting = value!;
                });
              },
            ),
            RadioListTile<String>(
              activeColor: darkMainColor,
              title: const Text(
                '나만보기',
                style: TextStyle(
                  color: darkgrey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              value: 'private',
              groupValue: selectedPublicSetting,
              onChanged: (String? value) {
                setState(() {
                  selectedPublicSetting = value!;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 25, 10, 6),
              child: SizedBox(
                height: 45,
                width: 400,
                child: ElevatedButton(
                  onPressed: () {
                    print('선택한 공개 설정: $selectedPublicSetting');
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(darkMainColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.5,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
