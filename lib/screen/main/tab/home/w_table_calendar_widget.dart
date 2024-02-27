import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/theme/colors.dart';
import '../../../../data/memory/todo_data.dart';
import '../../../../data/memory/vo_todo.dart';

class TableCalendarWidget extends StatelessWidget with TodoDataProvider {
  final OnDaySelected onDaySelected; // 날짜 선택 시 실행할 함수
  final DateTime selectedDate; // 선택된 날짜

  TableCalendarWidget({
    super.key,
    required this.onDaySelected,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'ko_KR',
      firstDay: DateTime(1800), // 달력의 최소 날짜
      lastDay: DateTime(3000), // 달력의 최대 날자
      // focusedDay: DateTime.now(), // 달력을 보여줄 때 기준이 되는 날
      calendarFormat: CalendarFormat.week, // 한 주만 보이도록
      daysOfWeekHeight: 20, // 요일 이름이 표시되는 영역의 높이를 설정
      rowHeight: 70,

      focusedDay: DateTime.now(),
      onDaySelected: onDaySelected,

      selectedDayPredicate: (date) =>
          date.year == selectedDate.year &&
          date.month == selectedDate.month &&
          date.day == selectedDate.day,

      eventLoader: (day) {
        final todos = TodoDataProvider()
            .todoData
            .todoList
            .where((e) =>
                e.date.day == day.day &&
                e.date.month == day.month &&
                e.date.year == day.year)
            .toList();
        return todos.isNotEmpty ? [todos.length] : [];
      },

      /*selectedDayPredicate: (DateTime day) {
        // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
        return isSameDay(selectedDay, day);
      },*/

      headerStyle: HeaderStyle(
        titleCentered: true,
        formatButtonVisible: false,
        titleTextFormatter: (date, locale) {
          int weekOfYear = ((date.day - date.weekday + 10) ~/ 7);
          return '${date.year}년 ${date.month}월 $weekOfYear주 차';
        },
        titleTextStyle: const TextStyle(
          fontSize: 16.5,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),

      calendarStyle: const CalendarStyle(
        // today 표시 여부
        isTodayHighlighted: true,

        // today 글자 조정
        todayTextStyle: TextStyle(
            //color: Colors.black,
            //fontSize: 16.0,
            ),

        // today 모양 조정
        todayDecoration: BoxDecoration(
          color: lightMainColor,
          shape: BoxShape.circle,
        ),

        // selectedDay 글자 조정
        selectedTextStyle: TextStyle(
          color: Color(0xFFFAFAFA),
          // fontSize: 16.0,
        ),

        // selectedDay 모양 조정
        selectedDecoration: BoxDecoration(
          color: mainColor,
          shape: BoxShape.circle,
        ),

        // outsideDay 글자 조정
        outsideTextStyle: TextStyle(color: Colors.black),

        // outsideDay 모양 조정
        outsideDecoration: BoxDecoration(shape: BoxShape.circle),
      ),

      calendarBuilders: CalendarBuilders(
        markerBuilder: (context, date, events) {
          if (events.isNotEmpty) {
            final todos = events[0] as List<Todo>;
            final isAllCompleted = todos.every((todo) => todo.isCompleted);

            return Positioned(
              bottom: 0,
              child: Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isAllCompleted
                      ? darkMainColor2
                      : mainColor, // 할일이 있으면 빨강색으로 표시합니다.
                ),
              ),
            );
          } else {
            return null;
          }
        },
      ),

      // calendarBuilders: CalendarBuilders(
      //   todayBuilder: (context, date, event) {
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Expanded(
      //           child: Container(
      //             width: 28.0,
      //             height: 30.0,
      //             decoration: BoxDecoration(
      //               //color: Colors.blue,
      //               border: Border.all(
      //                   color: const Color.fromARGB(255, 183, 183, 183),
      //                   width: 1.5),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: const Center(
      //               child: Text(
      //                 '0', // 글씨 추가
      //                 style: TextStyle(fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 5),
      //         Text(date.day.toString()), // 날짜 표시
      //       ],
      //     );
      //   },
      //   defaultBuilder: (context, date, event) {
      //     return Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Expanded(
      //           child: Container(
      //             width: 28.0,
      //             height: 30.0,
      //             decoration: BoxDecoration(
      //               //color: Colors.blue,
      //               border: Border.all(
      //                   color: const Color.fromARGB(255, 183, 183, 183),
      //                   width: 1.5),
      //               borderRadius: BorderRadius.circular(10),
      //             ),
      //             child: const Center(
      //               child: Text(
      //                 '1', // 글씨 추가
      //                 style: TextStyle(fontSize: 15),
      //               ),
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 5),
      //         Text(date.day.toString()), // 날짜 표시
      //       ],
      //     );
      //   },
      // ),
    );
  }
}
