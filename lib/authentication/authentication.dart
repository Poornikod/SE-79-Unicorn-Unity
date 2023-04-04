import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:seed_snap_app/authentication/exptations/signup_email_password_failure.dart';
import 'package:seed_snap_app/screens/home_screen.dart';
import 'package:seed_snap_app/screens/signIn.dart';

class Authentication extends GetxController {
  static Authentication get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialRoute);
  }

  _setInitialRoute(User? user) {
    user == null ? Get.offAll(() => SignInScreen()) : Get.offAll(() => HomeScreen());
  }

  void createUserWithEmailAndPassword(String email, String password, String username, String phone, String location) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => HomeScreen()) : Get.offAll(() => SignInScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FirebaseAuthException: ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("Exception: - ${ex.message}");
      throw ex;
    }
  }

  void loginUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
    } catch (_) {}
  }

  Future logout() async => await _auth.signOut();
}