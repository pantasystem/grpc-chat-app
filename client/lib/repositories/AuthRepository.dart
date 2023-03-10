import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Future<void> saveToken({required String? token}) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString("TOKEN", token ?? "");
  }

  Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    final token = preferences.getString("TOKEN");
    if (token == null || token.isEmpty) {
      return null;
    }
    return token;
  }
}
