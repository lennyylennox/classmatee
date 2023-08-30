import 'package:classmate/src/Dashboard/Profile/profilescreen.dart';
import 'package:classmate/src/Dashboard/RoleAdmin/schedulingpage.dart';
import 'package:classmate/src/Dashboard/dashboardcontroller.dart';
import 'package:classmate/src/common_widgets/boundingbox.dart';
import 'package:classmate/src/constants/colors.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminDashboardContent extends StatelessWidget {
  const AdminDashboardContent({super.key});

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome, Admin !",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              SizedBox(
                // -- BUTTON
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => SchedulingPage());
                  },
                  child: Text(
                    "Create a timetable".toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              Text(
                "Your timetables",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              SizedBox(
                height: 300,
                child: Center(
                  child: Text(
                    "No timetables created yet".toUpperCase(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
