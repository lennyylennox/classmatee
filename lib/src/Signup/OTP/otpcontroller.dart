import 'package:classmate/src/SignUp/Mail/mailverificationscreen.dart';
import 'package:classmate/src/SignUp/UserModules/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  final auth = FirebaseAuth.instance;
  var verificationId = ''.obs;
  var isSendingCode = false.obs;
  var codeSent = false.obs;

  void verifyOTP(String otp) async {
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(const MailVerification()) : Get.back();
  }

  Future<void> authenticatenumber(String phoneNo) async {
    isSendingCode.value = true;
    codeSent.value = false;
    await auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          Get.snackbar("Error", 'The provided number is invalid');
        } else {
          Get.snackbar("Error", e.code);
        }
      },
      codeSent: (String verificationId, resendToken) {
        this.verificationId.value = verificationId;
        isSendingCode.value = true;
        codeSent.value = true;
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
