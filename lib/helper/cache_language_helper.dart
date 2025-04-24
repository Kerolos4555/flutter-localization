import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> setLocale(String languageCode) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('languageCode', languageCode);
  }

  Future<String?> getLocale() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? languageCode = prefs.getString('languageCode');
    return languageCode;
  }
}
