import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:my_tom/core/services/Auth/auth_service.dart';

class MobileAuthService extends AuthService {
  final Dio _dio = Get.find<Dio>();
  final Auth0 auth0 = Auth0('my-app.eu.auth0.com', 'myAuth0ClientId');

  @override
  Future<void> loginAction() async {
    if (!(await auth0.credentialsManager.hasValidCredentials())) {
      await auth0.webAuthentication(scheme: "mydemoschema").login();
    }
  }

  @override
  Future<bool> checkIfLoggedIn() async {
    return await auth0.credentialsManager.hasValidCredentials();
  }

  @override
  Future<void> logoutAction() async {
    if (await auth0.credentialsManager.hasValidCredentials()) {
      await auth0.webAuthentication(scheme: "communityheroauth").logout();
    }
  }

  MobileAuthService() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (await auth0.credentialsManager.hasValidCredentials()) {
          Credentials credentials = await auth0.credentialsManager.credentials();
          options.headers["authorization"] = credentials.idToken;
        }
        return handler.next(options);
      },
    ));
  }
}
