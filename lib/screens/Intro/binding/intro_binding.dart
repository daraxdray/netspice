import 'package:get/get.dart';
import 'package:my_tom/screens/Intro/controller/intro_controller.dart';


class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}
