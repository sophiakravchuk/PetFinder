import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {

  String _userInfoKey = "user_info";

  getUserInfo() async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs.getString(_userInfoKey);
    } catch (error) {
      return 0;
    }
  }

  setUserInfo(String userInfo) async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      _prefs.setString(_userInfoKey, userInfo);
    } catch (error) {
      return;
    }
  }

  removeUserInfo() async {
    final _prefs = await SharedPreferences.getInstance();
    try {
      _prefs.remove(_userInfoKey);
    } catch (error) {
      return;
    }
  }

}
