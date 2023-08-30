import 'package:classmate/src/Signup/UserModules/authentication_repository.dart';
import 'package:classmate/src/Signup/UserModules/usermodel.dart';
import 'package:classmate/src/Signup/UserModules/userrepository.dart';
import 'package:classmate/src/Welcome/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  // -- Controllers
  final email = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();
  final password = TextEditingController();
  String? department = '';

  // -- Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // -- Get User Email and pass to UserRepository to fetch user record.
  getUserData() {
    final email = _authRepo.firebaseUser?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to confirm");
    }
  }

  updateRecord(UserModel user) async {
    await _userRepo.updateUserRecord(user);
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
