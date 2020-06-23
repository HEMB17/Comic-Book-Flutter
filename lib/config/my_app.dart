import 'package:comicbook/locale/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:comicbook/Styles/theme.dart';
import 'package:comicbook/features/comic_book/ui/screens/comic_book_screen/comic_book_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final AppLocalizationDelegate localeOverrideDelegate =
  //    AppLocalizationDelegate(Locale('en', 'EN'));
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: ComicBookHome(),
      localizationsDelegates: [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [const Locale('es', 'ES'), const Locale('en', 'US')],
    );
  }
}
