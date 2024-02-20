import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';

class CategoryAddFragment extends StatefulWidget {
  const CategoryAddFragment({super.key});

  @override
  State<CategoryAddFragment> createState() => _CategoryAddFragmentState();
}

class _CategoryAddFragmentState extends State<CategoryAddFragment> {
  final _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _isButtonEnabled = false;

  String _selectedPrivacy = '전체 공개';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    _controller.addListener(() {
      setState(() {
        _isButtonEnabled = _controller.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: backgroundColor,
            foregroundColor: darkMainColor,
            title: const Text(
              '카테고리 추가',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: darkMainColor,
              ),
            ),
            centerTitle: true,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    style: const TextStyle(fontSize: 14.0),
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      hintText: "카테고리 이름",
                      hintStyle: TextStyle(color: grey, fontSize: 13.5),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: darkMainColor, width: 1.5),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                                  child: const Text('전체 공개'),
                                  onPressed: () {
                                    setState(() {
                                      _selectedPrivacy = '전체 공개';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text('친구 공개'),
                                  onPressed: () {
                                    setState(() {
                                      _selectedPrivacy = '친구 공개';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                                CupertinoActionSheetAction(
                                  child: const Text('나만 보기'),
                                  onPressed: () {
                                    setState(() {
                                      _selectedPrivacy = '나만 보기';
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                              cancelButton: CupertinoActionSheetAction(
                                child: const Text('취소'),
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
                              _selectedPrivacy,
                              style: const TextStyle(color: darkMainColor),
                            ),
                            const SizedBox(width: 2),
                            const Icon(Icons.arrow_drop_down,
                                size: 23), // 삼각형 아이콘 추가
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  SizedBox(
                    height: 42,
                    width: 200,
                    child: OutlinedButton(
                      onPressed: _controller.text.isEmpty ? null : _addCategory,
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
                      child: const Text(
                        '추가하기',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _addCategory() {
    if (_controller.text.isNotEmpty) {
      Navigator.pop(
          context, {'name': _controller.text, 'privacy': _selectedPrivacy});
    }
  }
}
