import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<int> getOrganizationId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Organization_ID') ?? 0;
  }

  static Future<int> getBranchId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Branch_ID') ?? 0;
  }

  static Future<int> getLoginUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('UsersProfile_ID') ?? 0;
  }

  static Future<int> getGuardId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('Guards_ID') ?? 0;
  }

  static Future<int> scheduleId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('ScheduleDetailId') ?? 0;
  }
}
