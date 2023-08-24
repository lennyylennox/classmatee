import 'package:esugclassmate/src/Login/login_controller.dart';
import 'package:esugclassmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginBtnWidget extends StatelessWidget {
  const LoginBtnWidget({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.selectedOption,
    required this.controller,
    required this.length,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final String selectedOption;
  final LogInController controller;
  final double length;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length,
      child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              String domain =
                  selectedOption == 'student' ? '@st.ug.edu.gh' : 'ug.edu.gh';
              String userEmail = controller.email.text.trim() + domain;
              LogInController.instance.signInUser(
                  userEmail, controller.password.text.trim(), context);
            }
          },
          child: Text(
            tLogin.toUpperCase(),
          )),
    );
  }
}
