import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:my_tom/classes/User.dart';
import 'package:rxdart/subjects.dart';

class UserService extends GetxService {
  final BehaviorSubject<User> _myUserDetails = BehaviorSubject<User>();
  final Dio _dio = Get.find();

  Future<bool> isUserAccountCreated() async {
    Response response = await _dio.get("user/isUserAccountCreated");
    return response.data['accountExists'];
  }

  Future<void> initialUserSetup(String name, String description, DateTime birthDate) async {
    await _dio.post("user/initialUserSetup", data: {'name': name, 'description': description, 'birthDate': birthDate.toIso8601String()});
  }

  Future<User> getMyUserDetails() async {
    if (_myUserDetails.hasValue) {
      _dio.get("user/getMyUserDetails").then((Response response) {
        _myUserDetails.add(User.fromJson(response.data));
      });
    } else {
      try {
        Response response = await _dio.get("user/getMyUserDetails");
        _myUserDetails.add(User.fromJson(response.data));
      } catch (e, s) {
        print(e);
        print(s);
      }
    }
    return _myUserDetails.value!;
  }

  Future<User> getUserDetails(String userId) async {
    Response response = await _dio.post("user/getUserDetails", data: {'userId': userId});
    return User.fromJson(response.data);
  }

  Future<void> followUser(String userId) async {
    await _dio.post("user/followUser", data: {'userId': userId});
  }

  Future<void> unFollowUser(String userId) async {
    await _dio.post("user/unfollowUser", data: {'userId': userId});
  }

  Future<void> updateProfilePicture(Uint8List newProfilePicture, String filename) async {
    await _dio.post('post/createPost',
        data: FormData.fromMap({
          'image': MultipartFile.fromBytes(newProfilePicture, filename: filename),
        }));
  }

  Future<void> updateUserData(String name, String description) async {
    await _dio.post("user/updateUserData", data: {'name': name, 'description': description});
  }

  Future<void> deleteUser() async {
    await _dio.post("user/deleteUser");
  }

  Future<void> blockUser(User user) async {
    await _dio.post("user/blockUser", data: {'userId': user.id});
  }

  Future<void> unblockUser(User user) async {
    await _dio.post("user/unBlockUser", data: {'userId': user.id});
  }
}
