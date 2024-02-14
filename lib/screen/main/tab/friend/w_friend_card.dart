import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';
import 'w_friend_todo.dart';

class FriendCard extends StatelessWidget {
  const FriendCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 13),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          border: Border.all(
            color: grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset('assets/image/user.png', width: 60, height: 60),
              const SizedBox(width: 13),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '닉네임',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '친구 0명',
                    style: TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.bold,
                      color: mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 30),
              Flexible(
                child: ListView.builder(
                  itemCount: 5,
                  physics: const NeverScrollableScrollPhysics(), // 스크롤 불가능

                  itemBuilder: (BuildContext context, int index) {
                    return const FriendTodo();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
