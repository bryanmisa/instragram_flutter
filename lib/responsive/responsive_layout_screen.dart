import 'package:flutter/material.dart';
import 'package:instragram_flutter/utils/dimensions.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({
    super.key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, contraints) {
      // webScreenSize is a dimensions constant
      if (contraints.maxWidth > webScreenSize) {
        // web screen
        return webScreenLayout;
      }
      // mobile screen
      return mobileScreenLayout;
    });
  }
}
 