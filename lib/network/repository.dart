import 'package:dukkantek_assignment/config/config.dart';
import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'http_client.dart';

class Repository {
  HttpDataSource httpClient = HttpDataSource();
  late SharedPreferences prefs;
  late String token;

  Repository() {
    httpClient = HttpDataSource();
  }

  Future<LoggedInUserModel> login(email, password) async {
    return httpClient.login(email, password);
  }

  Future<LoggedInUserModel> googleSignIn() async {
    String? token = await loginWithGoogle();
    return httpClient.googleSignIn(token ?? "");
  }

  Future<String?> loginWithGoogle() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    return googleSignInAccount.serverAuthCode;
  }

  Future<bool> isAppFirstLaunch() async {
    /**
     * checks if this is the first time the app is launced
     * raises exception if key value of shared preferences is not boolean
     */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstLaunch = true;
    if (prefs.containsKey(Config.APP_FIRST_LAUNCH_KEY))
      isFirstLaunch = prefs.getBool(Config.APP_FIRST_LAUNCH_KEY) ?? false;
    else
      await prefs.setBool(Config.APP_FIRST_LAUNCH_KEY, true);
    return isFirstLaunch;
  }

  Future<LoggedInUserModel> getAuthenticatedUser() async {
    /**
     * returns the logged in user from shared prefrences
     */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LoggedInUserModel user = LoggedInUserModel.empty();

    user.username = prefs.getString(Config.USER_NAME_KEY);
    user.user_id = prefs.getInt(Config.USER_ID);
    user.token = prefs.getString(Config.TOKEN_KEY);
    return user;
  }

  Future<void> setAuthenticatedUser(LoggedInUserModel user) async {
    /**
     * sets the logged in user from shared prefrences
     */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Config.USER_NAME_KEY, user.username ?? "");
    await prefs.setInt(Config.USER_ID, user.user_id ?? -1);
    await prefs.setString(Config.TOKEN_KEY, user.token ?? "");
  }

  Future<void> setAppFirstLaunch(bool isFirstLaunch) async {
    /**
     * set first launch key in the shared preferences to the given value
     * raises exception if key value of shared preferences is not boolean
     */
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(Config.APP_FIRST_LAUNCH_KEY, isFirstLaunch);
  }
}
