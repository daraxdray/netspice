import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/routes/app_routes.dart';
import 'package:my_tom/screens/General/BottomNavigationPage.dart';
import 'package:my_tom/screens/General/WebAuth.dart';
import 'package:my_tom/screens/Intro/IntroPage.dart';
import 'package:my_tom/screens/Intro/binding/intro_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => IntroScreen(),
      // binding: HomeBinding(),
      // customTransition: ZoomInTransition(),
      transition: Transition.circularReveal,
      curve: Curves.easeIn,
      transitionDuration: Duration(milliseconds: 1200),

    ),

    GetPage(
        name: '/',
        page: () => const BottomNavigationPage(),
        binding: BottomNavigationBinding(),
      ),
      GetPage(
        name: '/webauth/:code',
        page: () => const WebAuthPage(),
        binding: WebAuthBinding(),
      ),
      GetPage(
        name: '/intro',
        page: () => IntroScreen(),
        binding: IntroBinding(),
      )
    ];
}