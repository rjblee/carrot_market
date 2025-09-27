import 'package:carrot_market/src/user/model/user_model.dart';
import 'package:carrot_market/src/user/repository/authentication_repository.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  AuthenticationController(this._authenticationRepository);

  final AuthenticationRepository _authenticationRepository;
  RxBool isLogined = false.obs;
  Rx<UserModel> userModel = const UserModel().obs;

  void authCheck() async {
    _authenticationRepository.user.listen((user) {
      _userStateChangedEvent(user);
    });
  }

  void _userStateChangedEvent(UserModel? user) async {
    if (user == null) {
      // unknown
    } else {
      // authentication or unAuthentication
    }
  }

  void logout() {
    isLogined(false);
  }
}
