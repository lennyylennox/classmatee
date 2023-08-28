import 'package:classmate/src/Signup/Mail/mailverificationcontroller.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: tDefaultSize,
                  left: tDefaultSize,
                  right: tDefaultSize,
                  bottom: tDefaultSize * 2,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      LineAwesomeIcons.envelope_open,
                      size: 100,
                    ),
                    const SizedBox(
                      height: tDefaultSize * 2,
                    ),
                    Text(
                      tEmailVerificationTitle.tr,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: tDefaultSize,
                    ),
                    Text(
                      tEmailVerificationSubTitle.tr,
                      style: Theme.of(context).textTheme.headlineMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: tDefaultSize * 2,
                    ),
                    SizedBox(
                      width: 200,
                      child: OutlinedButton(
                        child: Text(tContinue.tr),
                        onPressed: () {
                          controller.manuallyCheckEmailVerificationStatus();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: tDefaultSize * 2,
                    ),
                    TextButton(
                      onPressed: () {
                        controller.sendVerificationEmail();
                      },
                      child: Text(tResendEmailLink.tr),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.logout();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                              LineAwesomeIcons.alternate_long_arrow_left),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(tBacktoLogin.tr.toLowerCase()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
