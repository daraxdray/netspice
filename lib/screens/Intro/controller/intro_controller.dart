import 'package:get/get.dart';

class IntroController extends GetxController {
  static IntroController get to => Get.find();

  // final AuthService _authService = Get.find();
  // final UserService _userService = Get.find();
  // final FirstRunHelperService firstRunHelperService = Get.find();

  Future<void> loginAction() async {
    // await _authService.loginAction();
    // if (await _authService.checkIfLoggedIn() == true) {
    //   if ((await _userService.isUserAccountCreated()) == true) {
    //     firstRunHelperService.setFirstRun();
    //     Get.offAndToNamed("/");
    //   } else {
    //     Get.toNamed("/intro/setup");
    //   }
    // }
  }
}
