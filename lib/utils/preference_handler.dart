import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHandler {
  late SharedPreferences preferences;

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveEmpData(String empData) async {
    await preferences.setString("empDetails", empData);
  }

  String? getEmpData() {
    return preferences.getString("empDetails") ?? "";
  }
}