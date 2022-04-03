class UserProfileModel {
  String name;
  String profileImageUrl;
  String email;
  String ageClass;
  String gender;
  String phone;
  String newPassword;
  String country;
  String type;
  bool isProfileComplete = true;

  UserProfileModel(
      this.name,
      this.profileImageUrl,
      this.email,
      this.newPassword,
      this.ageClass,
      this.country,
      this.gender,
      this.type,
      this.phone);

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final profile = UserProfileModel(
        json["first_name"] == null || json["first_name"].isEmpty
            ? json["name"]
            : json["first_name"],
        (json["mpp_avatar"] as Map<String, dynamic>).containsKey("errors")
            ? json["avatar_urls"]["96"]
            : json["mpp_avatar"]["96"],
        json["user_email"],
        "",
        json["ysr_user_age"] == null || json["ysr_user_age"] == ""
            ? "غير ذلك"
            : json["ysr_user_age"],
        json["ysr_user_country"] == null || json["ysr_user_country"] == ""
            ? "غير ذلك"
            : json["ysr_user_country"],
        json["ysr_user_sex"] == null || json["ysr_user_sex"] == ""
            ? "غير ذلك"
            : json["ysr_user_sex"],
        json["ysr_user_type"] == null || json["ysr_user_type"] == ""
            ? "غير ذلك"
            : json["ysr_user_type"],
        json.containsKey("phone") && json["phone"] != null &&
                json["phone"].isNotEmpty
            ? json["phone"]
            : json["ysr_user_phone"]);

    profile.isProfileComplete = !(json["ysr_user_age"] == null ||
            json["ysr_user_age"] == "") &&
        !(json["ysr_user_country"] == null || json["ysr_user_country"] == "") &&
        !(json["ysr_user_sex"] == null || json["ysr_user_sex"] == "") &&
        !(json["ysr_user_type"] == null || json["ysr_user_type"] == "");
    return profile;
  }
}

class AgeClass {
  int id;
  String name;
  int value;
  AgeClass(this.id, this.name, this.value);
}

class Country {
  int id;
  String name;
  int code;
  Country(this.id, this.name, this.code);
}

class TypeClass {
  int id;
  String name;
  int value;
  TypeClass(this.id, this.name, this.value);
}
