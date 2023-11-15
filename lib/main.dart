import 'package:flutter/material.dart';
import 'package:instragram_flutter/responsive/mobile_screen_layout.dart';
import 'package:instragram_flutter/responsive/responsive_layout_screen.dart';
import 'package:instragram_flutter/responsive/web_screen_layout.dart';
import 'package:instragram_flutter/utils/colors.dart';

void main() {
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
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
