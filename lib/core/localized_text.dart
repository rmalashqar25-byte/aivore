enum AppLanguage { english, arabic }

class LocalizedText {
  const LocalizedText(this.en, this.ar);

  final String en;
  final String ar;

  String resolve(AppLanguage language) {
    return language == AppLanguage.arabic ? ar : en;
  }
}

extension AppLanguageX on AppLanguage {
  bool get isArabic => this == AppLanguage.arabic;

  String get code => isArabic ? 'AR' : 'EN';
}
