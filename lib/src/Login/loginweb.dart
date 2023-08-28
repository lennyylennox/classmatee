import 'package:classmate/src/ForgotPassword/forgotpasswordscreen.dart';
import 'package:classmate/src/Login/logincontroller.dart';
import 'package:classmate/src/Signup/signup_screen.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreenWeb extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  const LoginScreenWeb({super.key, this.controller, this.initialValue});

  @override
  State<LoginScreenWeb> createState() => _LoginScreenWebState();
}

class _LoginScreenWebState extends State<LoginScreenWeb> {
  String selectedOption = 'student';
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LogInController());

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = 300;
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Form(
          key: _formKey,
          child: SafeArea(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    // -- HEADER
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/svgs/home.svg',
                        semanticsLabel: 'Home SVG',
                        width: width * 0.675,
                        height: height * 0.675,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        tLoginTitle,
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        tLoginSubTitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 150,
                  ),
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: 'admin',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value.toString();
                              });
                            },
                          ),
                          const Text('Admin'),
                          Radio(
                            value: 'student',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value.toString();
                              });
                            },
                          ),
                          const Text('Student'),
                          Radio(
                            value: 'staff',
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value.toString();
                              });
                            },
                          ),
                          const Text('Staff'),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        // -- FORM
                        children: [
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: controller.email,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.email_outlined),
                                suffixText: selectedOption == 'student'
                                    ? '@st.ug.edu.gh'
                                    : selectedOption == 'staff'
                                        ? '@ug.edu.gh'
                                        : '@gmail.com',
                                labelText: tEmail,
                                hintText: tEmail,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: tDefaultSize / 2,
                          ),
                          SizedBox(
                            width: 300,
                            child: TextFormField(
                              controller: controller.password,
                              initialValue: widget.initialValue,
                              obscureText: !_isPasswordVisible,
                              decoration: InputDecoration(
                                labelText: tPassword,
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                  child: Icon(
                                    _isPasswordVisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: tDefaultSize / 2,
                          ),
                          Align(
                            // -- FORGOT PASSWORD BUTTON
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                ForgotPasswordScreen.buildShowModalBottomSheet(
                                    context);
                              },
                              child: const Text(tForgotPassword),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        // -- BUTTON
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            String domain;
                            if (selectedOption == 'student') {
                              domain = '@st.ug.edu.gh';
                            } else if (selectedOption == 'staff') {
                              domain = '@ug.edu.gh';
                            } else {
                              domain =
                                  '@gmail.com'; // Default domain for other cases
                            }

                            String email =
                                controller.email.text.trim() + domain;

                            controller.logInUser(
                              email,
                              controller.password.text.trim(),
                              context,
                            );
                          },
                          child: Text(
                            tLogin.toUpperCase(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextButton(
                        onPressed: () => Get.to(() => const SignupScreen()),
                        child: Text.rich(
                          TextSpan(
                            text: tDontHaveAnAccount,
                            style: Theme.of(context).textTheme.bodyLarge,
                            children: [
                              TextSpan(
                                text: tSignup.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
