import 'package:classmate/src/SignUp/Mail/mailverificationscreen.dart';
import 'package:classmate/src/Signup/UserModules/userrepository.dart';
import 'package:classmate/src/Signup/signupfailure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:classmate/src/Signup/UserModules/usermodel.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Textfield controllers to get data from textfields
  final email = TextEditingController();
  final fullName = TextEditingController();
  final password = TextEditingController();
  final phoneNo = TextEditingController();
  String? level = '';
  String department = '';

  final userRepo = Get.put(UserRepository());

  Future<bool> waitForEmailVerification(User user) async {
    while (true) {
      await user.reload();
      if (user.emailVerified) {
        return true;
      }
      await Future.delayed(Duration(seconds: 5)); // Adjust the delay as needed
    }
  }

  Future<void> createStudent(UserModel user) async {
    try {
      // Register the user with Firebase authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Send email verification
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        await firebaseUser.sendEmailVerification();
        //Get.to(() => OTPScreen(phoneNo: user.phoneNo));
        Get.to(() => MailVerification());
        await userRepo.createStudent(user);
        await userRepo.createUser(user);

        // Show a success message to the user
        Get.snackbar(
          "Success !",
          "Account Created. Let's get you verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.1),
          //snackStyle: SnackStyle.FLOATING,
          colorText: Colors.green,
          duration: const Duration(seconds: 2),
        );
      }
    } on FirebaseAuthException catch (e) {
      print('Error registering user: $e');
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar(
        "Oh Snap !",
        ex.message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }

  Future<void> createStaff(UserModel user) async {
    try {
      // Register the user with Firebase authentication
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );

      // Send email verification
      User? firebaseUser = FirebaseAuth.instance.currentUser;
      if (firebaseUser != null) {
        await firebaseUser.sendEmailVerification();
        //Get.to(() => OTPScreen(phoneNo: user.phoneNo));
        Get.to(() => MailVerification());
        await userRepo.createStaff(user);
        await userRepo.createUser(user);

        // Show a success message to the user
        Get.snackbar(
          "Success !",
          "Account Created. Let's get you verified",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green.withOpacity(0.1),
          //snackStyle: SnackStyle.FLOATING,
          duration: const Duration(seconds: 2),
        );

        // Store the user's account details in the database only after email verification
        if (await waitForEmailVerification(firebaseUser)) {
          // Store user data in the database
          await userRepo.createStaff(user);
        }
      }
    } on FirebaseAuthException catch (e) {
      print('Error registering user: $e');
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar(
        "Oh Snap !",
        ex.message,
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        colorText: Colors.red,
      );
    }
  }
}
