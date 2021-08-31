import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dj/screens/home_widget.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    DynamicTheme(
      themeCollection: ThemeCollection(
        themes: {
          0: ThemeData.light(),
          1: ThemeData.dark(),
        },
        fallbackTheme: ThemeData.light(),
      ),
      builder: (context, theme) => MaterialApp(
        title: 'DJ',
        theme: theme.copyWith(
          primaryColor: Color(0xFFFCCD06),
          primaryColorLight: Color(0xFFFCCD06),
          primaryColorDark: Color(0xFFFCCD06),
          accentColor: Color(0xFFFCCD06),
          toggleableActiveColor: Color(0xFFFCCD06),
          textSelectionTheme: Theme.of(context).textSelectionTheme.copyWith(
                cursorColor: Color(0xFFFCCD06),
                selectionColor: Color(0xFFFCCD06),
                selectionHandleColor: Color(0xFFFCCD06),
              ),
          buttonBarTheme: Theme.of(context).buttonBarTheme.copyWith(
                buttonTextTheme: ButtonTextTheme.accent,
              ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              primary: Color(0xFFFCCD06),
            ),
          ),
          floatingActionButtonTheme:
              Theme.of(context).floatingActionButtonTheme.copyWith(
                    backgroundColor: Color(0xFFFCCD06),
                  ),
        ),
        home: SplashScreen(
          navigateAfterSeconds: HomeWidget(),
          seconds: 1,
          image: Image.asset('assets/images/logo/icon-512x512.png'),
          backgroundColor: theme.canvasColor,
          photoSize: 80.0,
          useLoader: false,
          title: Text(''),
          loadingText: Text(''),
          loadingTextPadding: EdgeInsets.zero,
          styleTextUnderTheLoader: TextStyle(),
        ),
        localizationsDelegates: [
          FlutterI18nDelegate(
            translationLoader: FileTranslationLoader(
              fallbackFile: 'pt',
              basePath: 'assets/i18n',
            ),
          ),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
      ),
    ),
  );
}
