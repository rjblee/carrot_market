import 'package:carrot_market/src/common/components/getx_listener.dart';
import 'package:carrot_market/src/common/controller/authentication_controller.dart';
import 'package:carrot_market/src/common/controller/data_load_controller.dart';
import 'package:carrot_market/src/common/enum/authentication_status.dart';
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
        child: GetxListener<AuthenticationStatus>(
          listen: (AuthenticationStatus status) {
            switch (status) {
              case AuthenticationStatus.authentication:
                Get.offNamed('/home');
                break;
              case AuthenticationStatus.unAuthenticated:
                break;
              case AuthenticationStatus.unknown:
                Get.offNamed('/login');
                break;
              case AuthenticationStatus.init:
                break;
            }
          },
          stream: Get.find<AuthenticationController>().status,
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
              child: const _SplashView(),
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashView extends GetView<SplashController> {
  // GetView를 사용하면 위젯 내에서 controller에 바로 접근 가능
  const _SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 200,
          child: Column(
            children: [
              Obx(
                () => Text(
                  '${controller.loadStep.value.name}중 입니다.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              const CircularProgressIndicator(
                strokeWidth: 1,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
