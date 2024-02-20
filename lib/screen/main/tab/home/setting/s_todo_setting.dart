import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/screen/main/tab/home/setting/category/f_category.dart';

class TodoSettingScreen extends HookWidget {
  const TodoSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabControlloer = useTabController(initialLength: 2);

    return Material(
      child: Column(
        children: [
          AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: backgroundColor,
            foregroundColor: darkMainColor,
            title: const Text(
              '투두 설정',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            centerTitle: true,
          ),
          TabBar(
            controller: tabControlloer,
            tabs: const [Text('루틴 관리'), Text('카테고리 관리')],
            labelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            labelPadding: const EdgeInsets.symmetric(vertical: 10),
            indicatorColor: darkMainColor,
            labelColor: darkMainColor,
          ),
          Expanded(
              child: TabBarView(controller: tabControlloer, children: [
            Container(color: const Color.fromARGB(255, 255, 233, 240)),
            // const CategoryFragment(),
          ]))
        ],
      ),
    );
  }
}
