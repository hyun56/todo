import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';

class FriendTodo extends StatelessWidget {
  const FriendTodo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 19,
              height: 19,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: grey,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(width: 6),
            const Expanded(
              child: Text(
                '테스트테스트테스트테스트',
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
