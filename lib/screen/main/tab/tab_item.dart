import 'package:flutter/cupertino.dart';
import 'package:todo/common/theme/colors.dart';

import 'calendar/f_calendar.dart';
import 'friend/f_friend.dart';
import 'home/f_home.dart';
import 'mypage/f_mypage.dart';
import 'study/f_study.dart';

enum TabItem {
  calendar(CupertinoIcons.calendar, '모아보기', CalendarFragment()),
  home(CupertinoIcons.house_alt_fill, '투두', HomeFragment()),
  study(CupertinoIcons.book_fill, '스터디', StudyFragment()),
  friend(CupertinoIcons.person_2_fill, '친구', FriendFragment()),
  mypage(CupertinoIcons.person_fill, '마이', MypageFragment());

  final IconData activeIcon;
  final IconData inActiveIcon;
  final String tabName;
  final Widget firstPage;

  const TabItem(this.activeIcon, this.tabName, this.firstPage,
      {IconData? inActiveIcon})
      : inActiveIcon = inActiveIcon ?? activeIcon;

  BottomNavigationBarItem toNavigationBarItem(BuildContext context,
      {required bool isActivated}) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(tabName),
          isActivated ? activeIcon : inActiveIcon,
          color: isActivated ? darkMainColor : grey,
          size: 24,
        ),
        label: tabName);
  }
}
