import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:classmate/src/Signup/UserModules/usermodel.dart';

// -- User Repository To Perform Database Operations

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // -- Create User & Store Data In FireStore
  createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      return;
    }).catchError((error, stackTrace) {
      return error;
    });
  }

  // -- Create User & Store Data In FireStore
  createStudent(UserModel user) async {
    await _db
        .collection("Students/${user.department}/${user.level}")
        .add(user.toJson())
        .whenComplete(() {
      Get.snackbar("Success",
          "Your email has been registered to \n esugclassmate ! \n Let's get your number verified !.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
          duration: const Duration(seconds: 3));
    }).catchError((error, stackTrace) {
      Get.snackbar("Oh Snap !", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      return error;
    });
  }

  // -- Create User & Store Data In FireStore
  createStaff(UserModel user) async {
    await _db
        .collection("Staff/${user.department}")
        .add(user.toJson())
        .whenComplete(() {
      Get.snackbar("Success",
          "Your email has been registered to \n esugclassmate ! \n Let's get your number verified !.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green,
          duration: const Duration(seconds: 3));
    }).catchError((error, stackTrace) {
      Get.snackbar("Oh Snap !", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print('Error - $error');
      print('Stacktrace - $stackTrace');

      return error;
    });
  }

  // -- Fetch User Details
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single; //.toList()
    return userData;
  }

  // -- Fetch All Users
  Future<List<UserModel>> allUsers() async {
    final snapshot = await _db.collection("Students").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  // -- Update User Details
  Future<void> updateUserRecord(UserModel user) async {
    await _db.collection('Students').doc(user.id).update(user.toJson());
  }
}
