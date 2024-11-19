import 'package:flutter/material.dart';
import 'package:my_tom/data/models/intro_data.dart';

class AppConstants {
    static String appName = "Friendship Book";
   static  final List<IntroData> onboardingPages = [
    IntroData(
      title: 'Welcome to Friendship Book',
      description: 'Capture and preserve your most cherished memories digitally',
      image: 'assets/images/reading.png',
      gradient: [
       const Color(0xFF6A11CB),
        const Color(0xFF2575FC),
      ],
      iconData: Icons.book_online_rounded,
    ),
    IntroData(
      title: 'Share Moments Instantly',
      description: 'Upload photos, videos, and voice messages with ease',
      image: 'assets/images/sharing2.png',
      gradient: [
       const Color(0xFF00B4DB),
       const Color(0xFF0083B0),
      ],
      iconData: Icons.share_rounded,
    ),
    IntroData(
      title: 'Secure & Private',
      description: 'Your memories, totally protected with advanced privacy',
      image: 'assets/images/sharing3.png',
      gradient: [
      const  Color(0xFF42E695),
      const  Color(0xFF3BB2B8),
      ],
      iconData: Icons.lock_rounded,
    ),
  ];

}