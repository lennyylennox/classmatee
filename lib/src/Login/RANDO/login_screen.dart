import 'package:esugclassmate/src/Login/Desktop/loginscreen_desktop.dart';
import 'package:esugclassmate/src/Login/Mobile/loginscreen_mobile.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //var brightness = mediaQuery.platformBrightness;
    return Material(
      child: ScreenTypeLayout(
        mobile: const LoginScreenMobile(),
        desktop: const LoginScreenDesktop(),
      ),
    );
  }
}
