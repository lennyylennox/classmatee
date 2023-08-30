import 'package:classmate/src/Dashboard/Profile/profilescreen.dart';
import 'package:classmate/src/Dashboard/RoleAdmin/Departments.dart';
import 'package:classmate/src/Dashboard/RoleAdmin/courses.dart';
import 'package:classmate/src/Dashboard/RoleAdmin/lecturers.dart';
import 'package:classmate/src/Dashboard/RoleAdmin/timetable.dart';
import 'package:classmate/src/Dashboard/dashboardcontroller.dart';
import 'package:classmate/src/constants/colors.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedulingPage extends StatelessWidget {
  const SchedulingPage({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
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
                    borderRadius: BorderRadius.circular(20),
                    color: tCardBgColor),
                child: IconButton(
                  onPressed: () {
                    DashController.instance.logout();
                  },
                  icon: const Icon(Icons.logout),
                  color: Colors.red,
                  //icon: const Image(image: AssetImage(tUserProfileImage))
                ),
              ),
            ],
            bottom: TabBar(
              isScrollable: true,
              labelColor: Colors.black,
              tabs: [
                Tab(
                  child: Text(
                    'DEPARTMENTS',
                  ),
                ),
                Tab(
                  text: "LECTURERS",
                ),
                Tab(text: "COURSES"),
                Tab(text: "TIMETABLE")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Departments(),
              Lecturers(),
              Courses(),
              Timetable(),
            ],
          ),
        ),
      );
}
