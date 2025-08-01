import 'package:carrot_market/src/splash/enum/step_type.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Rx<StepType> loadStep =
      StepType.dataLoad.obs; // StepType 이라는 enum 타입을 변경하여 사용자에게 현재 진행 단계를 전달

  changeType(StepType type) {
    // 단계의 상태 변경을 담당하는 함수
    loadStep(type);
  }
}
