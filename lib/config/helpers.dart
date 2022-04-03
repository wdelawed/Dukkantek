import 'dart:convert';

import 'package:flutter/foundation.dart';

class Utils {
  static String handleErrorResponse(response) {
    try {
      final json = jsonDecode(response.body);
      return json["message"];
    } catch (e) {
      if (kReleaseMode) {
        return "حدث خطأ ما, يرجى اعادة المحاولة";
      } else if (response.statusCode == 404) {
        return "لم يتم العثور على البيانات";
      } else if (response.statusCode == 403) {
        return "لا يسمح لك بالوصول للبيانات";
      } else if (response.statusCode == 500) {
        return "مشكلة في المخدم";
      } else {
        return "خطأ غير معروف";
      }
    }
  }
}
