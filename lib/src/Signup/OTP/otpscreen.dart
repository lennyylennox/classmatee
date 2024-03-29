// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:classmate/src/Signup/OTP/otpcontroller.dart';
import 'package:classmate/src/constants/image_strings.dart';
import 'package:classmate/src/constants/sizes.dart';
import 'package:classmate/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({
    Key? key,
    required this.phoneNo,
  }) : super(key: key);
  String phoneNo;
  bool codeSent = false;

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(SignupController());
    final otpcontroller = Get.put(OTPController());
    final size = MediaQuery.of(context).size;

    //final phoneNo = phoneNo;
    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              left: tDefaultSize,
              right: tDefaultSize,
              bottom: tDefaultSize,
              top: tDefaultSize / 2,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image(
                      image: const AssetImage(tVerificationImage),
                      height: size.height * 0.05,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      tAppName,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Center(
                    child: Icon(
                  Icons.verified_user_outlined,
                  size: 100,
                )),
                const SizedBox(
                  height: 40.0,
                ),
                Text(
                  tOTPTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  tOTPSubTitle,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.0,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  keyboardType: TextInputType.number,
                  onSubmit: (code) {
                    otp = code;
                    OTPController.instance.verifyOTP(otp);
                  },
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "$tOTPMessage $phoneNo",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w200,
                      fontSize: 12.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Obx(
                  () => Align(
                    alignment: Alignment.centerRight,
                    child: otpcontroller.codeSent.value
                        ? Text(
                            "Code Sent") // Show "Code Sent" when code is sent
                        : otpcontroller.isSendingCode.value
                            ? CircularProgressIndicator(
                                color: Colors.black,
                              ) // Show CircularProgressIndicator while sending code
                            : TextButton(
                                onPressed: () {
                                  otpcontroller.authenticatenumber(
                                      phoneNo); // Call the sendOTP function
                                },
                                child: Text("Get Code"),
                              ),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      OTPController.instance.verifyOTP(otp);
                    },
                    child: const Text(tNext),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
