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
          // 어떤 타입을 listen 할지 제네릭 타입으로 정의
          initCall: () {
            controller.loadStep(
              StepType.dataLoad,
            ); // 초기 상태를 업데이트. 여기서는 초기 StepType을 dataLoad로 전달
          },
          stream: controller.loadStep, // loadStep 값이 바뀔때마다 listen이 호출됨
          listen: (StepType? value) {
            if (value == null) return;
            switch (value) {
              case StepType.init:
              case StepType.dataLoad:
                print('dataLoad');
                break;
              case StepType.authCheck:
                print('authCheck');
                break;
            }
          },
          child: Obx(
            () => Text(
              controller.loadStep.value.name,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
