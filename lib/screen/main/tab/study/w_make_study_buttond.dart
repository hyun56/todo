import 'package:flutter/material.dart';
import 'package:todo/common/theme/colors.dart';

class MakeStudyButton extends StatelessWidget {
  const MakeStudyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 85,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(0),
          foregroundColor: Colors.white,
          backgroundColor: mainColor,
          side: const BorderSide(color: mainColor, width: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // 원하는 각도로 조절
          ),
        ),
        child: const Text(
          '새로 만들기',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
