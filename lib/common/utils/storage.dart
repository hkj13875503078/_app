// ignore_for_file: unnecessary_new, prefer_final_fields, unnecessary_null_comparison, prefer_conditional_assignment, prefer_if_null_operators

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
/// 单例 StorageUtil().getItem('key')
class StorageUtil {
  static StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences? _prefs;

  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  /// 设置 json 对象
  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);
    return _prefs!.setString(key, jsonString);
  }

  /// 获取 json 对象
  dynamic getJSON(String key) {
    String? jsonString = _prefs!.getString(key);
    return jsonString == null ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs!.setBool(key, val);
  }

  bool getBool(String key) {
    bool? val = _prefs!.getBool(key);
    return val == null ? false : val;
  }

  Future<bool> remove(String key) {
    return _prefs!.remove(key);
  }
}
