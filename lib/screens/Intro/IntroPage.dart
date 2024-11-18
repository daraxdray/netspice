import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/services/Auth/auth_service.dart';
import 'package:my_tom/services/first_run_helper_service.dart';
import 'package:my_tom/services/user_service.dart';
import 'package:url_launcher/url_launcher.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}

class IntroController extends GetxController {
  static IntroController get to => Get.find();

  final AuthService _authService = Get.find();
  final UserService _userService = Get.find();
  final FirstRunHelperService firstRunHelperService = Get.find();

  Future<void> loginAction() async {
    await _authService.loginAction();
    if (await _authService.checkIfLoggedIn() == true) {
      if ((await _userService.isUserAccountCreated()) == true) {
        firstRunHelperService.setFirstRun();
        Get.offAndToNamed("/");
      } else {
        Get.toNamed("/intro/setup");
      }
    }
  }
}

class IntroPage extends GetView<IntroController> {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Expanded(
                child: Padding(
              padding: EdgeInsets.all(50),
              child: SafeArea(child: Image(image: AssetImage('assets/logo.png'))),
            )),
            Container(height: 100),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green.withAlpha(0),
                  Colors.green.withAlpha(0),
                  Colors.green.withAlpha(50),
                  Colors.green.withAlpha(100),
                  Colors.green.withAlpha(150),
                ],
              )),
            ),
          ],
        ),
        SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            SizedBox(
              height: 350,
              child: Column(
                children: [
                  const Text("My App", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.green)),
                  Container(height: 15),
                  const Padding(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Text(
                      "Some example text to explain what this app is about and why you should use it. Some example text to explain what this app is about and why you should use it.",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () => controller.loginAction(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 15, bottom: 15, right: 15, left: 15),
                          child: Row(
                            children: [
                              Text(
                                'Login / Register',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          controller.firstRunHelperService.setFirstRun();
                          Get.offAndToNamed("/");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12), // <-- Radius
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                          child: Row(
                            children: [
                              Text(
                                'Without Login',
                                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 10, color: Theme.of(context).primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(height: 20),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        launchUrl(Uri.parse("https://example.com/agbs.html"));
                      },
                      child: const Text(
                        "With using this app you agree to our terms and conditions",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            )
          ]),
        )
      ],
    ));
  }
}
