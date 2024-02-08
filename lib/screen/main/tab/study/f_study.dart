import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';
import 'package:todo/screen/main/tab/study/w_make_study_buttond.dart';
import 'package:todo/screen/main/tab/study/w_study_card.dart';
import 'package:todo/screen/main/tab/todo_appbar.dart';

class StudyFragment extends StatefulWidget {
  const StudyFragment({super.key});

  @override
  State<StudyFragment> createState() => _StudyFragmentState();
}

class _StudyFragmentState extends State<StudyFragment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TodoAppBar(title: '스터디'),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 23, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '0개',
                      style: TextStyle(
                        fontSize: 18,
                        color: darkMainColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '의 스터디에 참여 중이에요!',
                      style: TextStyle(
                        fontSize: 18,
                        //color: darkgrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                MakeStudyButton(),
              ],
            ),
          ),
          StudyCard(),
        ],
      ),
    );
  }
}
