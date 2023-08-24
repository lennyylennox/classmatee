import 'package:esugclassmate/src/Authentications/OTP/otp_screen.dart';
import 'package:esugclassmate/src/Dashboard/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:esugclassmate/src/Authentications/MailVerification/mail_verification.dart';
import 'package:esugclassmate/src/Authentications/exceptions.dart';
import 'package:esugclassmate/src/Authentications/login_failure.dart';
import 'package:esugclassmate/src/Authentications/signup_failure.dart';
import 'package:esugclassmate/src/Welcome/welcome_screen.dart';

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

  /// [EmailAuthentication] - LOGIN
  Future<void> loginWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar(
        "Oh Snap !",
        ex.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        snackStyle: SnackStyle.FLOATING,
      );
    }
    return;
  }

  /// [PhoneVerification] - VERIFICATION
  Future<void> phoneAuthentication(String phoneNo) async {
    codeSent.value = false;
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar("Error", "The number is invalid");
          } else {
            Get.snackbar("Oh Snap !", "Something went wrong. Try again");
          }
        },
        codeSent: (verificationId, resendToken) {
          this.verificationId.value = verificationId;
          codeSent.value = true;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          this.verificationId.value = verificationId;
        });
  }

  /// [OTPVerification] - VERIFICATION
  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
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

  /// [Logout]
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      throw e.message!;
    } on FormatException catch (e) {
      throw e.message;
    } catch (e) {
      throw 'Unable to logout. Try again';
    }
  }
}
