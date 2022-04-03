import 'dart:convert';
import 'package:dukkantek_assignment/config/helpers.dart';
import 'package:dukkantek_assignment/models/loggedIn_user_model.dart';

import 'package:http/http.dart' as http;

class HttpDataSource {
  final String _baseUrl = "https://62497c9620197bb4627368d4.mockapi.io";

  Future<LoggedInUserModel> login(String username, String password) async {
    print("Logging in $username => $password");
    final String url = "$_baseUrl/auth";
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/json",
    };

    final body =
        "user_email=${Uri.encodeComponent(username)}&password=${Uri.encodeComponent(password)}&user_id=12";
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return LoggedInUserModel.fromJson(json);
    } else if (response.statusCode == 403) {
      final json = jsonDecode(response.body);
      throw Exception(json["message"]);
    } else
      throw Exception(Utils.handleErrorResponse(response));
  }

  Future<LoggedInUserModel> googleSignIn(String token) async {
    final String url = "$_baseUrl/googleSignIn";
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded",
      "Accept": "application/json",
    };

    final body = "google_token=${Uri.encodeComponent(token)}&user_id=12";
    final response =
        await http.post(Uri.parse(url), headers: headers, body: body);

    if (response.statusCode == 201) {
      final json = jsonDecode(response.body);
      return LoggedInUserModel.fromJson(json);
    } else if (response.statusCode == 403) {
      final json = jsonDecode(response.body);
      throw Exception(json["message"]);
    } else
      throw Exception(Utils.handleErrorResponse(response));
  }
}
