import 'package:json_annotation/json_annotation.dart';

part 'loggedIn_user_model.g.dart';

@JsonSerializable()
class LoggedInUserModel {
  String? user_email;
  String? token;

  String? username;
  String? tokenExpiry;

  int? user_id;

  LoggedInUserModel(this.token, this.username, this.user_email, this.user_id,
      {this.tokenExpiry});
  factory LoggedInUserModel.fromJson(json) {
    return _$LoggedInUserModelFromJson(json);
  }
  factory LoggedInUserModel.empty() {
    return LoggedInUserModel(null, null, null, null, tokenExpiry: null);
  }
  Map<String, dynamic> toJson() {
    return _$LoggedInUserModelToJson(this);
  }

  static String? emailValidator(String? email) {
    if (!email!.contains("@") || !email.contains("."))
      return "This email is invalid";
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password!.isNotEmpty) return null;
    return "Password Field cannot be empty";
  }

  bool get tokenExpired {
    return isTokenExpired();
  }

  bool isTokenExpired() {
    /** returns weather or not user token has expired 
     * only works when token is not null and token expiry is also not null
     */
    return false;
  }
}
