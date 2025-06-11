import 'package:carrot_market/src/splash/enum/step_type.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Rx<StepType> loadStep = StepType.dataLoad.obs;

  changeType(StepType type) {
    loadStep(type);
  }
}
