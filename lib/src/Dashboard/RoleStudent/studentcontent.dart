import 'package:classmate/src/Dashboard/Profile/profilescreen.dart';
import 'package:classmate/src/Dashboard/dashboardcontroller.dart';
import 'package:classmate/src/constants/colors.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboardContent extends StatelessWidget {
  const StudentDashboardContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashController());
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.to(const ProfileScreen()),
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
          title: Text(
            tAppName,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: tCardBgColor),
              child: IconButton(
                onPressed: () {
                  controller.logout();
                },
                icon: const Icon(Icons.logout),
                color: Colors.red,
                //icon: const Image(image: AssetImage(tUserProfileImage))
              ),
            ),
          ],
        ),
        body: Center(child: Text("Student")));
  }
}
