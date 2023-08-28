import 'package:classmate/src/Signup/signupmobile.dart';
import 'package:classmate/src/Signup/signupweb.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var brightness = mediaQuery.platformBrightness;
    return Material(
      child: ScreenTypeLayout(
        mobile: const SignupScreenMobile(),
        desktop: const SignupScreenWeb(),
      ),
    );
  }
}
