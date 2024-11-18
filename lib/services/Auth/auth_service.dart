import 'package:get/get.dart';

abstract class AuthService extends GetxService {
  Future<void> loginAction();
  Future<void> logoutAction();
  Future<bool> checkIfLoggedIn();
}