import 'package:shared_preferences/shared_preferences.dart';

class SubscriptionStorage {
  static const _key = '_isSubscribed';

  static Future<bool> isSubscribed() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false;
  }

  static Future<void> buySubscription() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, true);
  }
}