import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/screen/main/tab/calendar/f_calendar.dart';
import 'package:todo/screen/main/tab/friend/f_friend.dart';
import 'package:todo/screen/main/tab/mypage/f_mypage.dart';
import 'package:todo/screen/main/tab/study/f_study.dart';

import '../../../../common/theme/colors.dart';
import '../../../../widget/w_category_banner.dart';
import '../../../../widget/w_category_routine_banner.dart';
import '../../../../widget/w_table_calendar_widget.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  // int _currentIndex = 1;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });

  //   switch (index) {
  //     case 0:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const CalendarFragment()),
  //       );
  //       break;
  //     case 1:
  //       break;
  //     case 2:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const StudyFragment()),
  //       );
  //       break;
  //     case 3:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const FriendFragment()),
  //       );
  //       break;
  //     case 4:
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(builder: (context) => const MypageFragment()),
  //       );
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
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
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: _onItemTapped,
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(
      //       icon: Icon(CupertinoIcons.calendar),
      //       label: '모아보기',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         CupertinoIcons.house_alt_fill,
      //         size: 26,
      //       ),
      //       label: '투두',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         CupertinoIcons.book_fill,
      //         size: 26,
      //       ),
      //       label: '스터디',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         CupertinoIcons.person_2_fill,
      //         size: 28,
      //       ),
      //       label: '친구',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(
      //         CupertinoIcons.person_fill,
      //         size: 25.5,
      //       ),
      //       label: '마이페이지',
      //     ),
      //   ],
      //   iconSize: 27,
      //   selectedItemColor: darkMainColor,
      //   selectedFontSize: 10,
      //   showUnselectedLabels: true,
      //   unselectedFontSize: 10,
      //   unselectedItemColor: grey,
      //   //unselectedLabelStyle: const TextStyle(color: grey),
      // ),
    );
    return scaffold;
  }
}
