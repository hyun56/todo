import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';

class TodoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const TodoAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: backgroundColor,
      foregroundColor: darkMainColor,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: darkgrey,
          ),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {}, icon: const Icon(CupertinoIcons.bell, size: 27)),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.gear, size: 28)),
        ),
      ],
    );
  }
}
