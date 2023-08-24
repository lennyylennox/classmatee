import 'package:classmate/src/ForgotPassword/forgotpasswordmailscreen.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(tDefaultSize - 10),
          topRight: Radius.circular(tDefaultSize - 10),
        ),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tForgotPasswordTitle,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            Text(
              tForgotPasswordSubTitle,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: tDefaultSize,
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.all(tDefaultSize - 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tDefaultSize / 3),
                  color: Colors.grey.shade200,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.email_outlined,
                      size: 60.0,
                    ),
                    const SizedBox(
                      width: tDefaultSize / 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tEmail,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          tResetViaEMail,
                          style: Theme.of(context).textTheme.bodyMedium,
                        )
                      ],
                    )
                  ],
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgotPasswordMailScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
