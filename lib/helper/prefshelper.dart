

import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper {
  static Future saveCart(String value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString("CART", value);
  }
}