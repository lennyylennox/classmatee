import 'package:classmate/src/Login/login_screen.dart';
import 'package:classmate/src/Signup/signup_screen.dart';
import 'package:classmate/src/common_widgets/fadein_animation/animation_design.dart';
import 'package:classmate/src/common_widgets/fadein_animation/fadein_animation_controller.dart';
import 'package:classmate/src/common_widgets/fadein_animation/fadein_animation_model.dart';
import 'package:classmate/src/constants/colors.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var width = mediaQuery.size.width;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;
    return SafeArea(
      child: Scaffold(
        backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
        body: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1200,
              animate: TAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                leftAfter: 0,
                leftBefore: 0,
                rightAfter: 0,
                rightBefore: 0,
                topAfter: 0,
                topBefore: 0,
              ),
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      'assets/svgs/home.svg',
                      semanticsLabel: 'Home SVG',
                      width: width * 0.35,
                      height: height * 0.35,
                    ),
                    Column(
                      children: [
                        Text(
                          tWelcomeTitle,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: OutlinedButton(
                                onPressed: () =>
                                    Get.to(() => const LoginScreen()),
                                child: Text(tLogin.toUpperCase()))),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () =>
                                    Get.to(() => const SignupScreen()),
                                child: Text(tSignup.toUpperCase()))),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
