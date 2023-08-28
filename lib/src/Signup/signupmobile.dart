import 'package:classmate/src/Login/login_screen.dart';
import 'package:classmate/src/SignUp/OTP/otpscreen.dart';
import 'package:classmate/src/Signup/UserModules/usermodel.dart';
import 'package:classmate/src/Signup/signupcontroller.dart';
import 'package:classmate/src/constants/image_strings.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreenMobile extends StatefulWidget {
  final String? initialValue;
  final TextEditingController? controller;
  const SignupScreenMobile({super.key, this.initialValue, this.controller});

  @override
  State<SignupScreenMobile> createState() => _SignupScreenMobileState();
}

class _SignupScreenMobileState extends State<SignupScreenMobile> {
  String selectedOption = 'student';
  final controller = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();
  final List<String> departments = [
    'Computer Engineering',
    'Food Processing Engineering',
    'Agricultural Engineering',
    'Biomedical Engineering',
    'Materials Engineering',
  ];
  final List<String> levels = ['100', '200', '300', '400'];
  String? selectedlevel = '';
  String selecteddepartment = '';

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                Column(
                  // -- HEADER
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                        image: AssetImage(tSignUpImage),
                        height: size.height * 0.25),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      tSignUpTitle,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      tSignUpSubTitle,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
                Container(
                  // -- BODY
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          // -- FORM
                          child: Column(
                            children: [
                              SizedBox(
                                // -- FULL NAME
                                width: 300,
                                child: TextFormField(
                                  controller: controller.fullName,
                                  decoration: const InputDecoration(
                                    labelText: tFullName,
                                    prefixIcon: Icon(Icons.person_2_outlined),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                // -- EMAIL
                                width: 300,
                                child: TextFormField(
                                  controller: controller.email,
                                  decoration: InputDecoration(
                                    labelText: tEmail,
                                    prefixIcon:
                                        const Icon(Icons.email_outlined),
                                    suffixText: selectedOption == 'student'
                                        ? '@st.ug.edu.gh'
                                        : '@ug.edu.gh',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: tDefaultSize / 2,
                              ),
                              SizedBox(
                                // -- PHONE NUMBER
                                width: 300,
                                child: TextFormField(
                                  controller: controller.phoneNo,
                                  maxLength: 9,
                                  decoration: const InputDecoration(
                                    label: Text(tPhoneNo),
                                    prefixIcon: Icon(Icons.phone),
                                    prefix: Text('+233 '),
                                    counterText: '',
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: tDefaultSize / 2,
                              ),
                              SizedBox(
                                // -- DEPARTMENTS
                                width: 300,
                                child: DropdownButtonFormField<String>(
                                  value: null,
                                  items: departments.map((String department) {
                                    return DropdownMenuItem<String>(
                                      value: department,
                                      child: Text(department),
                                    );
                                  }).toList(),
                                  onChanged: (selectedValue) {
                                    setState(() {
                                      selecteddepartment = selectedValue!;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      label: Text(tDept),
                                      prefixIcon: Icon(Icons.local_library)),
                                ),
                              ),
                              const SizedBox(
                                height: tDefaultSize / 2,
                              ),
                              if (selectedOption == 'student')
                                SizedBox(
                                  // -- LEVELS
                                  width: 300,
                                  child: DropdownButtonFormField<String>(
                                    value: null,
                                    items: levels.map((String level) {
                                      return DropdownMenuItem<String>(
                                        value: level,
                                        child: Text(level),
                                      );
                                    }).toList(),
                                    onChanged: (selectedValue) {
                                      setState(() {
                                        selectedlevel = selectedValue!;
                                      });
                                    },
                                    decoration: const InputDecoration(
                                        label: Text(tLevel),
                                        prefixIcon: Icon(Icons.school)),
                                  ),
                                ),
                              if (selectedOption == 'student')
                                const SizedBox(
                                  height: 20,
                                ),
                              SizedBox(
                                // -- PASSWORD
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
                                          _isPasswordVisible =
                                              !_isPasswordVisible;
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
                                height: tDefaultSize,
                              ),
                              SizedBox(
                                  // -- BUTTON
                                  width: 300,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        var number =
                                            '+233 ${controller.phoneNo.text.trim()}';
                                        String domain =
                                            selectedOption == 'student'
                                                ? '@st.ug.edu.gh'
                                                : '@ug.edu.gh';
                                        String userEmail =
                                            controller.email.text.trim() +
                                                domain;
                                        if (selectedOption == 'student') {
                                          final user = UserModel(
                                            fullName:
                                                controller.fullName.text.trim(),
                                            email: userEmail,
                                            password:
                                                controller.password.text.trim(),
                                            phoneNo: number,
                                            department: selecteddepartment,
                                            level: selectedlevel,
                                          );
                                          SignupController.instance
                                              .createStudent(user);
                                        } else {
                                          final user = UserModel(
                                            fullName:
                                                controller.fullName.text.trim(),
                                            email: userEmail,
                                            password:
                                                controller.password.text.trim(),
                                            phoneNo: number,
                                            department: selecteddepartment,
                                          );
                                          Get.offAll(() =>
                                              OTPScreen(phoneNo: user.phoneNo));
                                          SignupController.instance
                                              .createStaff(user);
                                        }
                                      }
                                    },
                                    child: Text(tSignup.toUpperCase()),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  // -- FOOTER
                  onPressed: () => Get.to(() => const LoginScreen()),
                  child: Text.rich(TextSpan(children: [
                    TextSpan(
                        text: tAlreadyHaveAnAccount,
                        style: Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: tLogin.toUpperCase()),
                  ])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
