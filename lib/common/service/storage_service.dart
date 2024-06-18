import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_2/common/values/constant.dart';

import '../entities/user.dart';

class StorageService {
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _prefs.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getIsLoggedIn() {
    return _prefs.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null ? false : true;
  }

  Future<bool> remove(String key) {
    return _prefs.remove(key);
  }

  UserItem getUserProfile() {
    var profileOffline = _prefs.getString(AppConstants.STORAGE_USER_PROFILE_KEY) ?? "";
    if (profileOffline.isNotEmpty) {
     return UserItem.fromJson(jsonDecode(profileOffline));
    }
    return UserItem();
  }
}