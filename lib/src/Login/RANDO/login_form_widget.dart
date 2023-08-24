// ignore_for_file: must_be_immutable

import 'package:esugclassmate/src/Login/login_controller.dart';
import 'package:esugclassmate/src/Password/ForgotPassword/forgotpassword_model_bottom_sheet.dart';
import 'package:esugclassmate/src/common_widgets/form/passwordformfield.dart';
import 'package:esugclassmate/src/constants/sizes.dart';
import 'package:esugclassmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginFormWidget extends StatelessWidget {
  LoginFormWidget({
    super.key,
    required this.controller,
    required this.selectedOption,
    required this.crossAxisAlignment,
    required this.width,
  });

  final LogInController controller;
  final String selectedOption;
  CrossAxisAlignment crossAxisAlignment;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
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
          PasswordFormField(
            width: width,
            controller: controller.password,
            labelText: tPassword,
            prefixIcon: const Icon(Icons.lock),
          ),
          const SizedBox(
            height: tDefaultSize / 2,
          ),
          // -- FORGOT PASSWORD BUTTON
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ForgotPasswordScreen.buildShowModalBottomSheet(context);
              },
              child: const Text(tForgotPassword),
            ),
          ),
        ],
      ),
    );
  }
}
