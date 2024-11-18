import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/helper/showNotLoggedInDialog.dart';
import 'package:my_tom/screens/Example/ExamplePage.dart';
import 'package:my_tom/screens/Home/HomePage.dart';
import 'package:my_tom/services/Auth/auth_service.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
  }
}

class BottomNavigationController extends GetxController {
  static BottomNavigationController get to => Get.find();
  final AuthService _authService = Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/home', '/example'];

  Future<void> changePage(int index, BuildContext context) async {
    if ((index == 5 || index == 3) && (await _authService.checkIfLoggedIn() == false)) {
      // Login is required for page 5 and 3
      showNotLoggedInDialog(context);
    } else {
      currentIndex.value = index;
      Get.offNamedUntil(pages[index], (page) => page.settings.name == '/', id: 1);
    }
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/home' || settings.name!.startsWith('/home')) {
      return GetPageRoute(
        settings: settings,
        page: () => HomePage(),
        binding: HomeBinding(),
      );
    } else if (settings.name == '/example') {
      return GetPageRoute(
        settings: settings,
        page: () => ExamplePage(),
        binding: ExampleBinding(),
      );
    } else {
      return null;
    }
  }
}

class BottomNavigationPage extends GetView<BottomNavigationController> {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        key: Get.nestedKey(1),
        initialRoute: '/home',
        onGenerateRoute: controller.onGenerateRoute,
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            selectedItemColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.black.withAlpha(100),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.leaderboard),
                label: 'Example',
              )
            ],
            currentIndex: controller.currentIndex.value,
            onTap: (int index) => controller.changePage(index, context)),
      ),
    );
  }
}
