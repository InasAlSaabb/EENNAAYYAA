import 'dart:convert';

import 'package:flutter_templete/app/app_config.dart';
import 'package:flutter_templete/core/data/models/apis/token_info.dart';
import 'package:flutter_templete/core/data/models/apis/user_model.dart';
import 'package:flutter_templete/core/data/models/cart_model.dart';
import 'package:flutter_templete/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrenceRepostory {
  SharedPreferences globalSharedPreference = Get.find();
  //!Keys------
  String PREF_FIRST_LUNCH = 'first_lunch';
  String PREF_FIRST_LOGIN = 'first_login';
  String PREF_TOKEN = 'token';
  String PREF_APP_LANG = 'app_lang';
  String PREF_CART_LIST = 'cart_list';
  String PREF_SUB_STATUS = 'sub_status';
  static String PREF_CURRENT_USER_EMAIL = "current user email";
  static String PREF_USER_INFO = 'user_info';
  static String PREF_USER_FCM = 'fcm';
  SaveUser(UserModel usermodel) {
    setPreference(
        value: json.encode(usermodel),
        dataType: DataType.STRING,
        key: PREF_USER_INFO);
  }

  UserModel GetUser() {
    return UserModel.fromJson(json.decode(getPreferenc(
      key: PREF_USER_INFO,
    )));
  }

  //list
  void setLoginInfo(List<String> value) async {
    await globalSharedPreference.setStringList(PREF_CURRENT_USER_EMAIL, value);
  }

  List<String> getLoginInfo() {
    return globalSharedPreference.getStringList(PREF_CURRENT_USER_EMAIL) ?? [];
  }

  // void retrieveUserEmail() {
  //  {
  //     userEmailList = prefs.getStringList(PREF_CURRENT_USER_EMAIL) ?? [];

  // }

  // void saveUserEmail(List<String> emailList) async {
  //   await globalSharedPreference.setStringList(
  //       PREF_CURRENT_USER_EMAIL, emailList);
  // }
  // void setLoginInfo(List<Object?> value) {
  //   setPreference(
  //       dataType: DataType.STRINGLIST,
  //       key: PREF_CURRENT_USER_EMAIL,
  //       value: value);
  // }

  // List<Object?> getLoginInfo() {
  //   if (globalSharedPreference.containsKey(PREF_CURRENT_USER_EMAIL))
  //     return getPreferenc(key: PREF_CURRENT_USER_EMAIL);
  //   else
  //     return [];
  // }

  void setTokenInfo(TokenInfo value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()), //string
      // json encode
      // بتاخد اوبجيكت
      // بترجع سترنغ
    );
  }

  TokenInfo? getTokenInfo() {
    if (globalSharedPreference.containsKey(PREF_TOKEN)) {
      return TokenInfo.fromJson(
        //formatted json
        jsonDecode(getPreferenc(key: PREF_TOKEN)),
      );
    } else {
      return null; //key not found
    }
  }

  void clearTokenInfo() {
    // globalSharedPreferences.remove(PREF_TOKEN);
    globalSharedPreference.clear();
    // globalSharedPreference.clear();
  }

  void setFirstLunch(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LUNCH,
      value: value,
    );
  }

  bool getFirstLunch() {
    if (globalSharedPreference.containsKey(PREF_FIRST_LUNCH)) {
      return getPreferenc(key: PREF_FIRST_LUNCH);
    } else {
      return true;
    }
  }

  void setFirstLogin(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LUNCH,
      value: value,
    );
  }

  bool getFirstLogin() {
    if (globalSharedPreference.containsKey(PREF_FIRST_LUNCH)) {
      return getPreferenc(key: PREF_FIRST_LOGIN);
    } else {
      return false;
    }
  }

  void setFcmToken(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_USER_FCM,
      value: value,
    );
  }

  String getFcmToken() {
    if (globalSharedPreference.containsKey(PREF_USER_FCM)) {
      return getPreferenc(key: PREF_USER_FCM);
    } else {
      return "";
    }
  }

//!Main Function
  setPreference(
      {required DataType dataType,
      required String key,
      required dynamic value}) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreference.setInt(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreference.setString(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreference.setDouble(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreference.setBool(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreference.setStringList(key, value);
        break;
    }
  }

  dynamic getPreferenc({required String key}) {
    return globalSharedPreference.get(key);
  }

  void setAppLanguage(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPreference.containsKey(PREF_APP_LANG)) {
      return getPreferenc(key: PREF_APP_LANG);
    } else {
      return AppConfig.defaultLanguage;
    }
  }

  void setCartList(List<CartModel> list) {
    setPreference(
        dataType: DataType.STRING,
        key: PREF_CART_LIST,
        value: CartModel.encode(list));
  }

  List<CartModel> getCartList() {
    if (globalSharedPreference.containsKey(PREF_CART_LIST)) {
      return CartModel.decode(getPreferenc(key: PREF_CART_LIST));
    } else
      return [];
  }

  void setSubStatus(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_SUB_STATUS,
      value: value,
    );
  }

  bool getSubStatus() {
    if (Get.find<SharedPreferences>().containsKey(PREF_SUB_STATUS)) {
      return getPreferenc(key: PREF_SUB_STATUS);
    } else {
      return true;
    }
  }

  bool get isLoggedIn => getTokenInfo() != null ? true : false;
  // bool get isLoggedIn=>getTokenInfo()==null?false:true;
}
