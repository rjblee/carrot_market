import 'package:carrot_market/src/user/model/user_model.dart';
import 'package:carrot_market/src/user/repository/authentication_repository.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;
  RxBool isLogined = false.obs;
  Rx<UserModel> userModel = const UserModel().obs;

  void authCheck() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    isLogined(true);
  }

  void logout() {
    isLogined(false);
  }
}
