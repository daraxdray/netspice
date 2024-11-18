import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:my_tom/services/Auth/auth_service.dart';

class WebAuthService extends AuthService {
  final Dio _dio = Get.find<Dio>();
  final Auth0Web auth0 = Auth0Web('my-app.eu.auth0.com', 'myClientID');

  @override
  Future<void> loginAction() async {
    if (!(await auth0.hasValidCredentials())) {
      await auth0.loginWithRedirect(redirectUrl: (kDebugMode ? 'http://localhost:8082' : 'https://app.example.com'));
    }
  }

  @override
  Future<bool> checkIfLoggedIn() async {
    return await auth0.hasValidCredentials();
  }

  @override
  Future<void> logoutAction() async {
    if (await auth0.hasValidCredentials()) {
      await auth0.logout();
    }
  }

  WebAuthService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (await auth0.hasValidCredentials()) {
          Credentials credentials = await auth0.credentials();
          options.headers["authorization"] = credentials.idToken;
        }
        return handler.next(options);
      },
    ));
  }

  Future<void> init() async {
    await auth0.onLoad();
  }
}
