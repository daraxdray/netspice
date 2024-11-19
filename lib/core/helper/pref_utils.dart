import 'dart:convert';
import 'dart:ui';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
    static SharedPreferences? _sharedPreferences;

  PrefUtils(){
    SharedPreferences.getInstance().then((value){
      _sharedPreferences = value;
    });

  }
  SharedPreferences? get getStorage => _sharedPreferences;
    Future<void> init() async {
      _sharedPreferences ??= await SharedPreferences.getInstance();
      print("Shared Preference Initialized");
    }


    void clearPreferencesData() async {
      _sharedPreferences!.clear();
    }

    Future<void> setThemeData(String value) {
      return _sharedPreferences!.setString('themeData',value);
    }

    String getThemeData() {
      try{
        return _sharedPreferences!.getString('themeData')!;
      }catch (e){
        return 'primary';
      }
    }

  
}