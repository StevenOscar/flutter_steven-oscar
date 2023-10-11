import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future<void> saveUserCredential ({required String tokenValue, required String usernameValue}) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.setString("token", tokenValue);
    sharedPref.setString("username", usernameValue);
  }

  Future<void> removeUserCredential () async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    sharedPref.remove("token");
    sharedPref.remove("username");
  }

  Future<Map<String, String>> getUserCredential () async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    Map<String, String> userCredentialMap = {};

    userCredentialMap["token"] = sharedPref.getString("token") ?? "";
    userCredentialMap["username"] =sharedPref.getString("username") ?? "";

    return userCredentialMap;
  }
}