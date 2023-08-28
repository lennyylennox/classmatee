import 'package:classmate/src/ForgotPassword/forgotpasswordscreen.dart';
import 'package:classmate/src/Login/logincontroller.dart';
import 'package:classmate/src/Signup/signup_screen.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  const LoginScreen({super.key, this.controller, this.initialValue});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String selectedOption = 'student';
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LogInController());

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;
    return SafeArea(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Column(
                  // -- HEADER
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/home.svg',
                      semanticsLabel: 'Home SVG',
                      width: width * 0.3,
                      height: height * 0.3,
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
                Row(
                  // -- RADIO
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                Column(
                  // -- FORM
                  children: [
                    SizedBox(
                      width: width,
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
                    TextFormField(
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
                  ],
                ),
                const SizedBox(
                  height: tDefaultSize / 2,
                ),
                Align(
                  // -- FORGOT PASSWORD BUTTON
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ForgotPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(tForgotPassword),
                  ),
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
                        domain = '@gmail.com'; // Default domain for other cases
                      }

                      String email = controller.email.text.trim() + domain;

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
                const SizedBox(height: 30.0),
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
          ),
        ),
      ),
    );
  }
}
