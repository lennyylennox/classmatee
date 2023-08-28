import 'dart:async';

import 'package:classmate/src/SignUp/UserModules/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Welcome/welcome_screen.dart';

class MailVerificationController extends GetxController {
  final _auth = FirebaseAuth.instance;
  late Timer timer;
  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }

  // -- Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      Get.snackbar("Success !", "Email Sent");
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Oh Snap !",
        e.code,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  // -- Set Timer To Check If Verification Has Been Completed Then Redirect
  void setTimerForAutoRedirect() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      final auth = FirebaseAuth.instance;
      auth.currentUser?.reload();
      final user = auth.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        // Determine the role based on the email domain
        final selectedRole = user.email?.endsWith("@st.ug.edu.gh") == true
            ? 'student'
            : user.email?.endsWith("@ug.edu.gh") == true
                ? 'staff'
                : 'admin';
        AuthenticationRepository.instance.setInitialScreen(user, selectedRole);
      }
    });
  }

  Future<void> resendEmailVerification() async {
    // Send email verification
    User? firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      await firebaseUser.sendEmailVerification();
    }
  }

  // -- Manually Check If Verification Completed Then Redirect
  void manuallyCheckEmailVerificationStatus() {
    final auth = FirebaseAuth.instance;
    auth.currentUser?.reload();
    final user = auth.currentUser;
    if (user!.emailVerified) {
      // Determine the role based on the email domain
      final selectedRole = user.email?.endsWith("@st.ug.edu.gh") == true
          ? 'student'
          : user.email?.endsWith("@ug.edu.gh") == true
              ? 'staff'
              : 'admin';
      AuthenticationRepository.instance.setInitialScreen(user, selectedRole);
    } else {
      Get.snackbar(
        "Oopsie !",
        "Email hasn't been verified yet",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
        snackStyle: SnackStyle.FLOATING,
      );
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
