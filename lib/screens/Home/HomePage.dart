import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/helper/showNotLoggedInDialog.dart';
import 'package:my_tom/screens/Home/first_tab.dart';
import 'package:my_tom/screens/Home/second_tab.dart';
import 'package:my_tom/services/Auth/auth_service.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  static HomeController get to => Get.find();
  final AuthService _authService = Get.find();
  late TabController tabController;

  var currentIndex = 0.obs;

  Future<void> changePage(int index, BuildContext context) async {
    if (index == 1 && await _authService.checkIfLoggedIn() == false) {
      showNotLoggedInDialog(context);
    } else {
      currentIndex.value = index;
    }
  }

  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() async {
      if (tabController.index == 1 && await _authService.checkIfLoggedIn() == false) {
        tabController.index = 0;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("My App"),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.email_outlined),
              onPressed: () {
                Get.toNamed("/another-page");
              },
            ),
            bottom: TabBar(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.tabController,
                indicatorColor: Colors.white,
                onTap: (int index) => controller.changePage(index, context),
                tabs: const [
                  Tab(child: Text("First Tab")),
                  Tab(child: Text("Second Tab")),
                ]),
          ),
          body: Obx(() => Container(child: controller.currentIndex.value == 0 ? FirstTab() : SecondTab())),
        ));
  }
}
