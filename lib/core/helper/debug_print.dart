import 'package:flutter/material.dart';

class DebugPrint {
  static void print(String label, Object value){
    debugPrint(label);
    debugPrint(value.toString());
  }
}