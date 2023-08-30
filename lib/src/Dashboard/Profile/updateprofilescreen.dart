import 'package:classmate/src/Dashboard/Profile/profilecontroller.dart';
import 'package:classmate/src/Signup/UserModules/usermodel.dart';
import 'package:classmate/src/constants/colors.dart';
import 'package:classmate/src/constants/image_strings.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(LineAwesomeIcons.angle_left),
        ),
        backgroundColor: Colors.transparent,
        title: Text(
          tEditProfile,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  UserModel user = snapshot.data as UserModel;

                  // -- Controllers
                  final email = TextEditingController(text: user.email);
                  final fullName = TextEditingController(text: user.fullName);
                  final phoneNo = TextEditingController(text: user.phoneNo);
                  return Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 120,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                //child: Icon(Icons.person),
                                child: const Image(
                                    image: AssetImage(tProfileImage))),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: tPrimaryColor,
                              ),
                              child: const Icon(
                                LineAwesomeIcons.camera,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: controller.fullName,
                              decoration: const InputDecoration(
                                labelText: tFullName,
                                prefixIcon: Icon(Icons.person_2_outlined),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: controller.email,
                              decoration: const InputDecoration(
                                labelText: tEmail,
                                prefixIcon: Icon(Icons.email_outlined),
                                /*suffixText: selectedOption == 'student'
                                  ? '@st.ug.edu.gh'7
                                  : '@ug.edu.gh',*/
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: controller.phoneNo,
                              decoration: const InputDecoration(
                                labelText: tPhoneNo,
                                prefixIcon: Icon(Icons.phone),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              initialValue: user.department,
                              decoration: const InputDecoration(
                                labelText: tDept,
                                prefixIcon: Icon(Icons.local_library),
                              ),
                              readOnly: true,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                                initialValue: user.level,
                                decoration: const InputDecoration(
                                  labelText: tLevel,
                                  prefixIcon: Icon(Icons.school),
                                ),
                                readOnly: true),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: controller.password,
                              initialValue: user.password,
                              decoration: const InputDecoration(
                                labelText: tPassword,
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final userData = UserModel(
                                    email: email.text.trim(),
                                    password: controller.password.text.trim(),
                                    fullName: fullName.text.trim(),
                                    phoneNo: phoneNo.text.trim(),
                                    department: controller.department,
                                  );

                                  await controller.updateRecord(userData);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    side: BorderSide.none,
                                    shape: const StadiumBorder()),
                                child: const Text(
                                  tSubmit,
                                  style: TextStyle(color: tDarkColor),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text.rich(
                                  TextSpan(
                                    text: tJoined,
                                    style: TextStyle(fontSize: 12),
                                    children: [
                                      TextSpan(
                                          text: tJoinedAt,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 110,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            Colors.redAccent.withOpacity(0.1),
                                        //elevation: 0,
                                        foregroundColor: Colors.red,
                                        shape: const StadiumBorder(),
                                        side: BorderSide.none),
                                    child: const Text(tDelete),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(
                    child: Text("Something went wrong"),
                  );
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
