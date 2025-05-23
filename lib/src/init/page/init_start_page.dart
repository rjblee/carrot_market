import 'package:carrot_market/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/components/btn.dart';

class InitStartPage extends StatelessWidget {
  final Function() onStart;

  const InitStartPage({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 99,
              height: 116,
              child: Image.asset('assets/images/logo_simbol.png'),
            ),
            const SizedBox(height: 40),
            AppFont('당신 근처의 밤톨마켓', fontWeight: FontWeight.bold, size: 20),

            const SizedBox(height: 15),
            AppFont(
              '중고 거래부터 동네 정보까지, \n지금 내 동네를 선택하고 시작해보세요!',
              align: TextAlign.center,
              size: 18,
              color: Colors.white.withValues(alpha: 0.6),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 25,
          right: 25,
          bottom:
              25 +
              Get
                  .mediaQuery
                  .padding
                  .bottom, //iOS 하단에서는 위로 올리려면 나타나는 제어센터 영역 때문에 더 큰 간격 추가
        ),
        child: Btn(
          onTap: onStart,
          child: const AppFont(
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
