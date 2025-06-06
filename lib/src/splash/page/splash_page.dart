import 'package:carrot_market/src/common/components/getx_listener.dart';
import 'package:carrot_market/src/splash/controller/splash_controller.dart';
import 'package:carrot_market/src/splash/enum/step_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  // GetView를 사용하면 위젯 내에서 controller에 바로 접근 가능
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetxListener<StepType>(
          initCall: () {
            controller.loadStep(StepType.dataLoad);
          },
          stream: controller.loadStep,
          child: Obx(
            () => Text(
              '${controller.loadStep.value.name}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
