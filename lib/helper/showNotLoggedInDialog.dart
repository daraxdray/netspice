import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

Future<void> showNotLoggedInDialog(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Not logged in"),
          content: const Text("When you want to use this feature, you have to be logged in."),
          actions: [
            TextButton(
                onPressed: () {
                  Get.toNamed("/intro");
                },
                child: const Text("Login now")),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            )
          ],
        );
      });
}
