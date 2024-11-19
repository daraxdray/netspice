import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/services/Auth/auth_service.dart';

class WebAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebAuthController());
  }
}

class WebAuthController extends GetxController {
  static WebAuthController get to => Get.find();
  final AuthService authService = Get.find();

  @override
  void onInit() {
    super.onInit();
  }
}

class WebAuthPage extends GetView<WebAuthController> {
  const WebAuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return Column(
          children: [
            const CircularProgressIndicator(),
            Container(
              height: 20,
            ),
            const Text("You are being redirected to the login page"),
          ],
        );
      },
    ));
  }
}
