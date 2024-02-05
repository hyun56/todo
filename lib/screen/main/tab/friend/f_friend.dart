import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screen/main/tab/todo_appbar.dart';

class FriendFragment extends StatefulWidget {
  const FriendFragment({super.key});

  @override
  State<FriendFragment> createState() => _FriendFragmentState();
}

class _FriendFragmentState extends State<FriendFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TodoAppBar(title: '친구'),
      body: Column(),
    );
  }
}
