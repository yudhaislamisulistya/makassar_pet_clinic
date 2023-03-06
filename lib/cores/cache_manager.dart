// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:get_storage/get_storage.dart';

mixin CacheManager {
  Future<Map<String, String?>> saveUser(String? userKey, Map<String, String?> userValue) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERID.toString(), jsonEncode(userValue));
    return userValue;
  }

  Map<String, dynamic> getUser() {
    final box = GetStorage();
    final user = box.read(CacheManagerKey.USERID.toString());
    if (user != null) {
      return jsonDecode(user);
    } else {
      return {};
    }
  }

  Future<bool> saveUsername(String? username) async {
    final box = GetStorage();
    await box.write(CacheManagerKey.USERNAME.toString(), username);
    return true;
  }

  String? getUsername() {
    final box = GetStorage();
    return box.read(CacheManagerKey.USERNAME.toString());
  }

  Future<void> removeUsernameAndUserid() async {
    final box = GetStorage();
    await box.remove(CacheManagerKey.USERNAME.toString());
    await box.remove(CacheManagerKey.USERID.toString());
  }
}

enum CacheManagerKey {
  USERNAME,
  USERID,
}
