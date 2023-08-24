import 'package:classmate/src/common_widgets/fadein_animation/animation_design.dart';
import 'package:classmate/src/common_widgets/fadein_animation/fadein_animation_controller.dart';
import 'package:classmate/src/common_widgets/fadein_animation/fadein_animation_model.dart';
import 'package:classmate/src/constants/colors.dart';
import 'package:classmate/src/constants/image_strings.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startSplashAnimation();
    var height = MediaQuery.of(context).size.height;
    var splashImageLoc = (height / 2) - 176;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            TFadeInAnimation(
              durationInMs: 1600,
              animate: TAnimatePosition(
                  topAfter: -15,
                  topBefore: -30,
                  leftAfter: -20,
                  leftBefore: -30),
              child: const Image(image: AssetImage(tSplashTopIcon)),
            ),
            TFadeInAnimation(
              durationInMs: 2000,
              animate: TAnimatePosition(
                topAfter: 110,
                topBefore: 110,
                leftAfter: tDefaultSize,
                leftBefore: 80,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tAppName,
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  Text(
                    tAppTagLine,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            TFadeInAnimation(
                durationInMs: 2000,
                animate: TAnimatePosition(
                    leftAfter: 0,
                    leftBefore: 0,
                    rightAfter: 70,
                    rightBefore: 70,
                    bottomAfter: splashImageLoc,
                    bottomBefore: 0),
                child: const Image(image: AssetImage(tSplashImage))),
            TFadeInAnimation(
              durationInMs: 2000,
              animate: TAnimatePosition(
                  rightAfter: tDefaultSize,
                  rightBefore: tDefaultSize,
                  bottomAfter: 60,
                  bottomBefore: 0),
              child: Container(
                width: tDefaultSize,
                height: tDefaultSize,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: tPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
