import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';

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
            onPressed: () {}, icon: const Icon(CupertinoIcons.bell, size: 28)),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.square_list, size: 29)),
        ),
      ],
    );
  }
}
