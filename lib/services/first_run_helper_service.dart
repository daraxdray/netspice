import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';

import 'package:shared_preferences/shared_preferences.dart';

class FirstRunHelperService extends GetxService {
  final SharedPreferences _sharedPreferences = Get.find();

  Future<bool> isFirstRun() async {
    bool? didFirstRun = _sharedPreferences.getBool("didFirstRun");
    if (didFirstRun != null || didFirstRun == true) {
      return false;
    } else {
      return true;
    }
  }

  setFirstRun() async {
    await _sharedPreferences.setBool("didFirstRun", true);
  }

  deleteFirstRun() async {
    await _sharedPreferences.setBool("didFirstRun", false);
  }
}
