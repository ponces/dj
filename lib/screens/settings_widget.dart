import 'dart:async';
import 'package:flutter/material.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/services.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsWidget extends StatefulWidget {
  @override
  _SettingsWidgetState createState() => _SettingsWidgetState();
}

enum AppTheme {
  System,
  Light,
  Dark,
}

enum Language {
  System,
  English,
  Portuguese,
}

class _SettingsWidgetState extends State<SettingsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: I18nText(
          'settingsWidget.widgetTitle',
          child: Text(
            '',
            style: TextStyle(color: Colors.grey[850]),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.grey[850]),
      ),
      body: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          AppTheme appTheme = AppTheme.System;
          Language language = Language.System;
          if (snapshot.hasData) {
            appTheme = AppTheme.values[
                snapshot.data!.getInt('appTheme') ?? AppTheme.System.index];
            language = Language.values[
                snapshot.data!.getInt('language') ?? Language.System.index];
          }
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: I18nText('settingsWidget.appearanceSectionTitle'),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: I18nText('settingsWidget.appThemeSettings'),
                    subtitle: _getAppThemeWidget(appTheme),
                    onTap: () => _showAppThemeDialog(snapshot.data, appTheme),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: I18nText('settingsWidget.languageSettings'),
                    subtitle: _getLanguageWidget(language),
                    onTap: () => _showLanguageDialog(snapshot.data, language),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showAppThemeDialog(
    SharedPreferences? prefs,
    AppTheme appTheme,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (context) => SimpleDialog(
        title: I18nText('settingsWidget.appThemeSettings'),
        children: <Widget>[
          RadioListTile<AppTheme>(
            value: AppTheme.System,
            groupValue: appTheme,
            onChanged: (value) => _updateAppTheme(prefs!, value!),
            title: _getAppThemeWidget(AppTheme.System),
          ),
          RadioListTile<AppTheme>(
            value: AppTheme.Light,
            groupValue: appTheme,
            onChanged: (value) => _updateAppTheme(prefs!, value!),
            title: _getAppThemeWidget(AppTheme.Light),
          ),
          RadioListTile<AppTheme>(
            value: AppTheme.Dark,
            groupValue: appTheme,
            onChanged: (value) => _updateAppTheme(prefs!, value!),
            title: _getAppThemeWidget(AppTheme.Dark),
          ),
        ],
      ),
    );
  }

  Future<void> _showLanguageDialog(
    SharedPreferences? prefs,
    Language language,
  ) async {
    return showDialog<void>(
      context: context,
      builder: (context) => SimpleDialog(
        title: I18nText('settingsWidget.languageSettings'),
        children: <Widget>[
          RadioListTile<Language>(
            value: Language.System,
            groupValue: language,
            onChanged: (value) => _updateLanguage(prefs!, value!),
            title: _getLanguageWidget(Language.System),
          ),
          RadioListTile<Language>(
            value: Language.English,
            groupValue: language,
            onChanged: (value) => _updateLanguage(prefs!, value!),
            title: _getLanguageWidget(Language.English),
          ),
          RadioListTile<Language>(
            value: Language.Portuguese,
            groupValue: language,
            onChanged: (value) => _updateLanguage(prefs!, value!),
            title: _getLanguageWidget(Language.Portuguese),
          ),
        ],
      ),
    );
  }

  Widget _getAppThemeWidget(AppTheme appTheme) {
    I18nText widget;
    switch (appTheme) {
      case AppTheme.Light:
        widget = I18nText('settingsWidget.optionLight');
        break;
      case AppTheme.Dark:
        widget = I18nText('settingsWidget.optionDark');
        break;
      default:
        widget = I18nText('settingsWidget.optionSystem');
        break;
    }
    return widget;
  }

  Widget _getLanguageWidget(Language language) {
    I18nText widget;
    switch (language) {
      case Language.English:
        widget = I18nText('settingsWidget.optionEnglish');
        break;
      case Language.Portuguese:
        widget = I18nText('settingsWidget.optionPortuguese');
        break;
      default:
        widget = I18nText('settingsWidget.optionSystem');
        break;
    }
    return widget;
  }

  Future<void> _updateAppTheme(SharedPreferences prefs, AppTheme value) async {
    Navigator.of(context).pop();
    await prefs.setInt('appTheme', value.index);
    setState(() {});
    switch (value) {
      case AppTheme.Light:
        DynamicTheme.of(context)!.setTheme(0);
        break;
      case AppTheme.Dark:
        DynamicTheme.of(context)!.setTheme(1);
        break;
      default:
        if (MediaQuery.of(context).platformBrightness == Brightness.light) {
          DynamicTheme.of(context)!.setTheme(0);
        } else {
          DynamicTheme.of(context)!.setTheme(1);
        }
        break;
    }
  }

  Future<void> _updateLanguage(SharedPreferences prefs, Language value) async {
    Navigator.of(context).pop();
    await prefs.setInt('language', value.index);
    setState(() {});
    switch (value) {
      case Language.English:
        await FlutterI18n.refresh(
          context,
          Locale('en'),
        );
        break;
      case Language.Portuguese:
        await FlutterI18n.refresh(
          context,
          Locale('pt'),
        );
        break;
      default:
        await FlutterI18n.refresh(
          context,
          Localizations.localeOf(context),
        );
        break;
    }
  }
}
