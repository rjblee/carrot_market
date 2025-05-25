import 'package:carrot_market/src/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Text('Splash 페이지', style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
