import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/data/memory/todo_data_holder.dart';
import 'package:todo/screen/main/tab/home/todo/w_todo_list.dart';
import 'w_home_appbar.dart';
import 'w_category_banner.dart';
import 'w_table_calendar_widget.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> with TodoDataProvider {
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            //const SizedBox(height: 2),

            Expanded(
              child: ListView(
                children: [
                  TableCalendarWidget(
                    selectedDate: selectedDate,
                    onDaySelected: onDaySelected,
                  ),
                  //const SizedBox(height: 5),
                  //TodayBanner(selectedDate: selectedDate),
                  // const CategoryRoutineBanner(
                  //   title: '루틴',
                  // ),
                  //TodoCard(content: 'test'),
                  //TodoCard(content: 'test2'),
                  //const SizedBox(height: 20),
                  CategoryBanner(
                    title: '기본 카테고리',
                    selectedDate: selectedDate,
                  ),
                  const SizedBox(height: 20),
                  CategoryBanner(
                    title: '카테고리 2',
                    selectedDate: selectedDate,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: TodoList(),
            ),
            FloatingActionButton(
              onPressed: () async {
                todoData.addTodo(selectedDate);
              },
              child: const Icon(CupertinoIcons.add),
            ),
          ],
        ),
      ),
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate) {
    setState(() {
      this.selectedDate = selectedDate;
    });
  }
}
