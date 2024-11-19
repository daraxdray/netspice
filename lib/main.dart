import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/constants/app_constants.dart';
import 'package:my_tom/core/routes/app_pages.dart';
import 'package:my_tom/screens/General/BottomNavigationPage.dart';
import 'package:my_tom/screens/General/WebAuth.dart';
import 'package:my_tom/screens/Intro/IntroPage.dart';
import 'package:my_tom/core/services/Auth/MobileAuthService.dart';
import 'package:my_tom/core/services/Auth/WebAuthService.dart';
import 'package:my_tom/core/services/Auth/auth_service.dart';
import 'package:my_tom/core/services/example_service.dart';
import 'package:my_tom/core/services/first_run_helper_service.dart';
import 'package:my_tom/core/services/user_service.dart';
import 'package:my_tom/screens/Intro/binding/intro_binding.dart';
import 'package:shared_preferences/shared_preferences.dart';

dynamic _parseAndDecode(String response) {
  return jsonDecode(response) as dynamic;
}

Future<dynamic> parseJson(String text) {
  return compute(_parseAndDecode, text);
}

Future<void> initServices() async {
  Get.put(await SharedPreferences.getInstance());
  Get.put(FirstRunHelperService());
  Dio dio = Dio();
  Get.put(dio);
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      if (kDebugMode) {
        print("REQ: ${options.method} ${options.uri}");
      }
      return handler.next(options);
    },
    onResponse: (response, handler) {
      if (kDebugMode) {
        print("RES: ${response.statusCode} ${response.realUri}");
      }
      return handler.next(response);
    },
    onError: (e, handler) {
      if (kDebugMode) {
        print("ERR: ${e.message} ${e.response?.statusCode} ${e.response?.statusMessage} ${e.response?.data} ${e.stackTrace}");
      }
      return handler.next(e);
    },
  ));
  dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;
  dio.options =
      BaseOptions(baseUrl: "https://api.example.com/", connectTimeout: const Duration(seconds: 3), receiveTimeout: const Duration(seconds: 12));
  // BaseOptions(baseUrl: "http://192.168.178.44:3000/", connectTimeout: const Duration(seconds: 5), receiveTimeout: const Duration(seconds: 3));

  final AuthService authService;
  if (kIsWeb) {
    WebAuthService webAuthService = WebAuthService();
    await webAuthService.init();
    authService = webAuthService;
  } else {
    authService = MobileAuthService();
  }
  Get.put(authService);

  Get.put(UserService());
  Get.put(ExampleService());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  bool firstRun = await Get.find<FirstRunHelperService>().isFirstRun();
  
  runApp(GetMaterialApp(
    title: AppConstants.appName,
    color: Colors.green,
    theme: ThemeData(primaryColor: Colors.green, appBarTheme: const AppBarTheme(color: Colors.green), bottomAppBarTheme: BottomAppBarTheme(color: Colors.green)),
    debugShowCheckedModeBanner: false,
    initialRoute: (firstRun) ? '/intro' : '/',
    defaultTransition: Transition.fade,
    getPages: AppPages.routes,
  ));
}
