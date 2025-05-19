import 'package:carrot_market/src/common/components/app_font.dart';
import 'package:flutter/material.dart';

class Btn extends StatelessWidget {
  const Btn({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        borderRadius: BorderRadius.circular(7),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15),
          color: const Color(0XffED7738),
          child: AppFont(
            "시작하기",
            align: TextAlign.center,
            size: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
