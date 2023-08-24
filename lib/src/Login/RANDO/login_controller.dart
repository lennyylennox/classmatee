import 'package:esugclassmate/src/Authentications/authentication_repository.dart';
import 'package:esugclassmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogInController extends GetxController {
  static LogInController get instance => Get.find();
  late BuildContext context;
  //TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // -- Loader
  final isLoading = false.obs;

  /// This func will be used to register user with [EMAIL] & [Password]
  void signInUser(String email, String password, BuildContext context) {
    String? error = AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password, context) as String?;
    final auth = AuthenticationRepository.instance;
    auth.setInitialScreen(auth.firebaseUser);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }

  /// [EmailAndPasswordLogin]
  Future<void> login() async {
    try {
      isLoading.value = true;
      if (!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(
          email.text.trim(), password.text.trim(), context);
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      Get.snackbar(tOhSnap, e.toString());
    }
  }
}
