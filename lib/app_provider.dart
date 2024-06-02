import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  int? _selectedMonth;
  int? _selectedYear;
  SharedPreferences? _preferences;

  int? get selectedMonth => _selectedMonth;
  int? get selectedYear => _selectedYear;

  static Future<AppProvider> getInstance() async {
    AppProvider provider = AppProvider();
    provider._preferences = await SharedPreferences.getInstance();
    try {
      int? selectedMonth = provider._preferences?.getInt("selectedMonth");
      int? selectedYear = provider._preferences?.getInt("selectedYear");

      provider._selectedMonth = selectedMonth;
      provider._selectedYear = selectedYear;
    } catch (err) {
      debugPrint("Error loading preferences: $err");
    }
    provider.notifyListeners();
    return provider;
  }

  Future<void> sync() async {
    if (_selectedMonth != null) await _preferences!.setInt("selectedMonth", _selectedMonth!);
    if (_selectedYear != null) await _preferences!.setInt("selectedYear", _selectedYear!);
  }

  Future<void> update({int? selectedMonth, int? selectedYear}) async {
    _selectedMonth = selectedMonth ?? _selectedMonth;
    _selectedYear = selectedYear ?? _selectedYear;
    await sync();
    notifyListeners();
  }

  Future<void> updateSelectedMonth(int selectedMonth) async {
    _selectedMonth = selectedMonth;
    await sync();
    notifyListeners();
  }

  Future<void> updateSelectedYear(int selectedYear) async {
    _selectedYear = selectedYear;
    await sync();
    notifyListeners();
  }

  Future<void> reset() async {
    await _preferences!.remove("selectedMonth");
    await _preferences!.remove("selectedYear");

    _selectedMonth = null;
    _selectedYear = null;

    notifyListeners();
  }
}
