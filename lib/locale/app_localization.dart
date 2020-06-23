import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  get titleScreenHome => Intl.message("titleScreenHome");
  get titleCharacters => Intl.message("titleCharacters");
  get titleTeams => Intl.message("titleTeams");
  get titleLocalization => Intl.message("titleLocalization");
  get titleConcepts => Intl.message("titleConcepts");
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) => AppLocalization.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) => false;
}
