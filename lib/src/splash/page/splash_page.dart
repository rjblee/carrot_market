import 'package:carrot_market/src/common/components/getx_listener.dart';
import 'package:carrot_market/src/common/controller/authentication_controller.dart';
import 'package:carrot_market/src/common/controller/data_load_controller.dart';
import 'package:carrot_market/src/splash/controller/splash_controller.dart';
import 'package:carrot_market/src/splash/enum/step_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/components/app_font.dart';

class SplashPage extends GetView<SplashController> {
  // GetView를 사용하면 위젯 내에서 controller에 바로 접근 가능
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GetxListener<bool>(
          listen: (bool isLogined) {
            if (isLogined) {
              Get.offNamed('/home');
            } else {
              Get.offNamed('/login');
            }
          },
          stream: Get.find<AuthenticationController>().isLogined,
          child: GetxListener<bool>(
            listen: (bool value) {
              if (value) {
                // true 값이 넘어왔다는 것은 데이터 로드가 완료되었다는 뜻. 그래서 다음 단계인 authCheck 으로 업데이트
                controller.loadStep(StepType.authCheck);
              }
            },
            stream: Get.find<DataLoadController>().isDataLoad,
            child: GetxListener<StepType>(
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
                    Get.find<DataLoadController>().loadData(); // 데이터 로드를 진행
                    break;
                  case StepType.authCheck:
                    Get.find<AuthenticationController>()
                        .authCheck(); // 인증 체크 진행
                    break;
                }
              },
              child: Obx(
                () => Text(
                  '${controller.loadStep.value.name}중 입니다.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashPage extends GetView<SplashController> {
  // GetView를 사용하면 위젯 내에서 controller에 바로 접근 가능
  const _SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 200),
          Expanded(
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
        ],
      ),
    );
  }
}
