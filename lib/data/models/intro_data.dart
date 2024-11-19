import 'package:flutter/material.dart';

class IntroData {
  final String title;
  final String description;
  final String image;
  final List<Color> gradient;
  final IconData iconData;

  IntroData({
    required this.title,
    required this.description,
    required this.image,
    required this.gradient,
    required this.iconData,
  });
}