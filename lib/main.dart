// ignore_for_file: unused_import

import 'package:classmate/firebase_options.dart';
import 'package:classmate/src/Dashboard/RoleAdmin/admincontent.dart';
import 'package:classmate/src/Signup/UserModules/authentication_repository.dart';
import 'package:classmate/src/Welcome/splash_screen.dart';
import 'package:classmate/src/Welcome/welcome_screen.dart';
import 'package:classmate/src/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo: Add Local Storage
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  debugPaintSizeEnabled = false;
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    Widget homeScreen;
    if (kIsWeb) {
      //homeScreen = const AdminDashboardContent();
      homeScreen = const WelcomeScreen();
    } else {
      homeScreen = const SplashScreen();
      //homeScreen = const AdminDashboardContent();
    }
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: homeScreen,
    );
  }
}
