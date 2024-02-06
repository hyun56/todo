import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/screen/main/tab/friend/w_friend_card.dart';
import 'package:todo/screen/main/tab/friend/w_invitation_button.dart';
import 'package:todo/screen/main/tab/todo_appbar.dart';

class FriendFragment extends StatefulWidget {
  const FriendFragment({super.key});

  @override
  State<FriendFragment> createState() => _FriendFragmentState();
}

class _FriendFragmentState extends State<FriendFragment> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TodoAppBar(title: '친구'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
            child: TextField(
              controller: _textEditingController,
              focusNode: _focusNode,
              decoration: InputDecoration(
                //labelText: "닉네임 또는 이메일 검색",
                contentPadding: const EdgeInsets.symmetric(vertical: 5),
                hintText: "닉네임 또는 이메일 검색",
                hintStyle: const TextStyle(color: grey, fontSize: 13.5),
                prefixIcon: Icon(Icons.search,
                    color: _isFocused ? darkMainColor : grey),
                suffixIcon: _isFocused
                    ? IconButton(
                        icon: const Icon(CupertinoIcons.clear_circled,
                            color: grey),
                        onPressed: () {
                          _textEditingController.clear();
                          _focusNode.unfocus();
                        },
                      )
                    : null,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: darkMainColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide(color: grey, width: 2),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 23, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '0명',
                      style: TextStyle(
                        fontSize: 18,
                        color: darkMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '의 친구가 있어요!',
                      style: TextStyle(
                        fontSize: 18,
                        //color: darkgrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                InvitationButton(),
              ],
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return const FriendCard();
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textEditingController.dispose();
    super.dispose();
  }
}
