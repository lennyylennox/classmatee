import 'package:classmate/src/common_widgets/fadein_animation/fadein_animation_controller.dart';
import 'package:classmate/src/common_widgets/fadein_animation/fadein_animation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    Key? key,
    required this.durationInMs,
    this.animate,
    required this.child,
  }) : super(key: key);

  final controller = Get.put(FadeInAnimationController());
  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedPositioned(
        duration: const Duration(milliseconds: 2000),
        top: controller.animate.value ? animate!.topAfter : animate!.topBefore,
        left:
            controller.animate.value ? animate!.leftAfter : animate!.leftBefore,
        right: controller.animate.value
            ? animate!.rightAfter
            : animate!.rightBefore,
        bottom: controller.animate.value
            ? animate!.bottomAfter
            : animate!.bottomBefore,
        child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: controller.animate.value ? 1 : 0,
            child: child),
      ),
    );
  }
}
