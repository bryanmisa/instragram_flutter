import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instragram_flutter/firebase_options.dart';
import 'package:instragram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instragram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instragram_flutter/responsive/web_screen_layout.dart';
import 'package:instragram_flutter/screens/login_screen.dart';
import 'package:instragram_flutter/screens/signup_screen.dart';
import 'package:instragram_flutter/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //ensure that the flutter widget has been initialized
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyA4GMlVpK3SWmiRKzVVDvaVmPG571O_RKU",
        appId: "1:43655460223:web:6bd5d619c1945c11c4964a",
        messagingSenderId: "43655460223",
        projectId: "instagram-tutorial-95668",
        storageBucket: "instagram-tutorial-95668.appspot.com",
      ),
    );
  } else {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // ResponsiveLayout() Custom Widget to check which screen size is used.
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
      home: const SignupScreen(),
    );
  }
}
