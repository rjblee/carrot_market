import 'package:carrot_market/src/common/components/app_font.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  Widget _logoView() {
    return Column(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const AppFont('로그인')));
  }
}
