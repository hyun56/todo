import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screen/main/tab/todo_appbar.dart';

import 'home_appbar.dart';
import 'w_category_banner.dart';
import 'w_category_routine_banner.dart';
import 'w_table_calendar_widget.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          //const SizedBox(height: 2),

          Expanded(
            child: ListView(
              children: const [
                TableCalendarWidget(),
                //const SizedBox(height: 5),
                CategoryRoutineBanner(
                  title: '루틴',
                ),
                //TodoCard(content: 'test'),
                //TodoCard(content: 'test2'),
                SizedBox(height: 20),
                CategoryBanner(
                  title: '카테고리이이이이이이',
                ),
                SizedBox(height: 20),
                CategoryBanner(
                  title: '기본 카테고리',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
