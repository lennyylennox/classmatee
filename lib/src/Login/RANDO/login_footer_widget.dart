import 'package:esugclassmate/src/SignUp/signup_screen.dart';
import 'package:esugclassmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Get.to(() => const SignupScreen()),
      child: Text.rich(TextSpan(
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
      )),
    );
  }
}
