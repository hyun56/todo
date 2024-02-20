import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nav/nav.dart';
import 'package:todo/common/theme/colors.dart';

import 'setting/s_todo_setting.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
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
      title: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          '투두',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: darkMainColor,
          ),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.bell, size: 26),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              Nav.push(const TodoSettingScreen());
            },
            icon: const Icon(CupertinoIcons.list_bullet, size: 27.5),
          ),
        ),
      ],
    );
  }
}
