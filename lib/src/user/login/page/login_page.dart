import 'package:carrot_market/src/common/components/app_font.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: const AppFont('로그인')));
  }
}
