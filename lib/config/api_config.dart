import 'package:flutter/foundation.dart';

class ApiConfig {
  static String get baseUrl {
    if (kDebugMode) {
      //local
      return "http://192.168.1.123:8000";
    } else {
      //production
      return "https://fulodev-api.onrender.com";
    }
  }

  static String get blogUrl => '$baseUrl/blogs';
  static String get createMessageUrl => '$baseUrl/create_message';
}
