import 'package:classmate/src/Dashboard/RoleAdmin/admincontent.dart';
import 'package:classmate/src/Dashboard/RoleStaff/staffcontent.dart';
import 'package:classmate/src/Dashboard/RoleStudent/studentcontent.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  final String role;

  const Dashboard({required this.role});

  @override
  Widget build(BuildContext context) {
    Widget content;

    // Determine the content based on the user's role
    if (role == 'admin') {
      content = AdminDashboardContent();
    } else if (role == 'student') {
      content = StudentDashboardContent();
    } else if (role == 'staff') {
      content = StaffDashboardContent();
    } else {
      content = Container(); // Default case
    }

    return content;
  }
}
