import 'package:flutter/material.dart';
import 'package:protfolio/utils/translations.dart';

class Language {
  final String name;
  final String code;
  final String flag;

  Language(this.name, this.code, this.flag);
}

class LanguageProvider extends ChangeNotifier {
  static final List<Language> languages = [
    Language('English', 'en', '🇺🇸'),
    Language('বাংলা', 'bn', '🇧🇩'),
    Language('हिंदी', 'hi', '🇮🇳'),
    Language('العربية', 'ar', '🇸🇦'),
  ];

  Language _currentLanguage = languages[0];

  Language get currentLanguage => _currentLanguage;

  void setLanguage(Language language) {
    if (_currentLanguage != language) {
      _currentLanguage = language;
      notifyListeners();
    }
  }

  String translate(String key) {
    return AppTranslations.getTranslation(key, _currentLanguage.code);
  }
} 