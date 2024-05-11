import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YoussefUiProvider extends ChangeNotifier {
  bool _isDark = false;
  bool get isDark => _isDark;

  Locale _locale = Locale('en', 'US'); // Default locale is English
  Locale get locale => _locale;

  late SharedPreferences storage;

  //Custom dark theme
  final darkTheme = ThemeData(
    primaryColor: Colors.black12,
    brightness: Brightness.dark,
    primaryColorDark: Colors.black12,
  );

  //Custom light theme
  final lightTheme = ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light,
    primaryColorDark: Colors.white,
  );

  //Dark mode toggle action
  void toggleDarkMode() {
    _isDark = !_isDark;

    // Save the value to secure storage
    storage.setBool("isDark", _isDark);
    notifyListeners();
  }

  // Language toggle action
  void toggleLanguage(String newValue) {
    if (newValue == 'fr') {
      _locale = Locale('fr', 'FR'); // Switch to French
    } else {
      _locale = Locale('en', 'US'); // Switch to English
    }
    notifyListeners();
  }

  // Getter to check if the current language is English
  bool get isEnglish => _locale.languageCode == 'en';

  //Init method of provider
  Future<void> init() async {
    // After we rerun the app
    storage = await SharedPreferences.getInstance();
    _isDark = storage.getBool("isDark") ?? false;
    notifyListeners();
  }
}
