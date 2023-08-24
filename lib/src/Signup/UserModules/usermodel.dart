import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String? level;
  final String? department;
  final String password;
  final String phoneNo;

  const UserModel({
    this.id,
    required this.fullName,
    required this.email,
    this.level,
    this.department,
    required this.password,
    required this.phoneNo,
  });

  toJson() {
    return {
      "Full Name": fullName,
      "Email": email,
      "Level": level,
      "Department": department,
      "Password": password,
      "Phone Number": phoneNo,
    };
  }

  // -- Map user fetched from firebase to userModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullName: data["Full Name"],
        email: data["Email"],
        department: data["Department"],
        password: data["Password"],
        level: data["Level"],
        phoneNo: data["Phone Number"]);
  }
}
