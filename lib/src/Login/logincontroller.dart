import 'package:classmate/src/Dashboard/dashboard.dart';
import 'package:classmate/src/Login/loginfailure.dart';
import 'package:classmate/src/SignUp/Mail/mailverificationscreen.dart';
import 'package:classmate/src/SignUp/UserModules/authentication_repository.dart';
import 'package:classmate/src/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late BuildContext context;
  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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

  void signInUser(String email, String password, BuildContext context) {
    String? error =
        loginWithEmailAndPassword(email, password, context) as String?;
    final auth = AuthenticationRepository.instance;
    auth.setInitialScreen(auth.firebaseUser);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  Future<void> logInUser(
      String email, String password, BuildContext context) async {
    try {
      final authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (authResult.user != null && authResult.user!.emailVerified) {
        // User is signed in and email is verified, navigate to the Dashboard screen
        Get.offAll(() => Dashboard());
      } else {
        // Email is not verified, show a message
        Get.offAll(() => MailVerification());
      }
    } on FirebaseAuthException catch (e) {
      // Handle authentication errors
      Get.snackbar(
        "Authentication Error",
        e.message!,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        snackStyle: SnackStyle.FLOATING,
      );
    } catch (e) {
      // Handle other errors
      print("Error: $e");
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
