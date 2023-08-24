import 'package:classmate/src/Dashboard/dashboard.dart';
import 'package:classmate/src/Signup/Mail/mailverificationscreen.dart';
import 'package:classmate/src/Signup/OTP/otpscreen.dart';
import 'package:classmate/src/Signup/signupfailure.dart';
import 'package:classmate/src/Welcome/welcome_screen.dart';
import 'package:classmate/src/common_widgets/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // -- Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
  var verificationId = ''.obs;
  var codeSent = false.obs;

  // -- Getters
  User? get firebaseUser => _firebaseUser.value;
  String get getUserId => firebaseUser?.uid ?? "";
  String get getUserEmail => firebaseUser?.email ?? "";

  // -- When app launches this function will be called and set the firebaseUser state
  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 2000));
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());
    FlutterNativeSplash.remove();
    setInitialScreen(_firebaseUser.value);
  }

  // -- Setting Initial Screen
  setInitialScreen(User? user) async {
    user == null
        ? null //Get.offAll(() => const WelcomeScreen())
        : user.emailVerified
            ? Get.offAll(() => const Dashboard())
            : Get.offAll(() => const MailVerification());
  }

  /// [EmailAuthentication] - REGISTER
  Future<void> createUserWithEmailAndPassword(
      String email, String password, String phoneNo) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firebaseUser.value != null
          ? Get.offAll(() => OTPScreen(phoneNo: phoneNo))
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      Get.snackbar(
        "Oh Snap !",
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        snackStyle: SnackStyle.FLOATING,
      );
      throw ex;
      //return ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      Get.snackbar(
        "Oh Snap !",
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        snackStyle: SnackStyle.FLOATING,
      );
      //return ex.message;
    }
    return;
    //return null;
  }

  /// [EmailVerification] - VERIFICATION
  Future<void> sendEmailVerification() async {
    //print(_auth.currentUser);
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.toString());
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }
}