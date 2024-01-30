import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../widgets/category_banner.dart';
import '../widgets/table_calendar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: backgrounColor,
        foregroundColor: darkMainColor,
        title: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "투두",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.bell, size: 28)),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.gear, size: 29)),
          ),
        ],
      ),
      body: Column(
        children: [
          //const SizedBox(height: 2),

          Expanded(
            child: ListView(
              children: const [
                TableCalendarWidget(),
                //const SizedBox(height: 5),
                CategoryBanner(
                  title: 'Category 1',
                ),
                //TodoCard(content: 'test'),
                //TodoCard(content: 'test2'),
                SizedBox(height: 20),
                CategoryBanner(
                  title: '카테고리이이이이이이 2',
                ),
                SizedBox(height: 20),
                CategoryBanner(
                  title: '카테고리 test',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
