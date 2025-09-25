import 'package:carrot_market/src/user/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxService {
  // GetxService는 GetxController와 달리 한번 등록 되면 앱이 종료될 때까지 유지됨
  final FirebaseAuth _firebaseAuth;

  AuthenticationRepository(this._firebaseAuth);

  Stream<UserModel?> get user {
    return _firebaseAuth.authStateChanges().map<UserModel?>((user) {
      return user == null
          ? null
          : UserModel(name: user.displayName, uid: user.uid, email: user.email);
    });
  }

  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _firebaseAuth.signInWithCredential(credential);
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
