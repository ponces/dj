import 'package:dj/screens/bible_widget.dart';
import 'package:dj/screens/blog_widget.dart';
import 'package:dj/screens/info_widget.dart';
import 'package:dj/screens/media_widget.dart';
import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:dj/screens/settings_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _currentTab = 0;
  List<Widget> _tabs = List.empty();

  @override
  void initState() {
    super.initState();
    _applyAppSettings();
    _tabs = [
      BlogWidget(),
      BibleWidget(),
      MediaWidget(),
      InfoWidget(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: I18nText(
            'homeWidget.widgetTitle',
            child: Text(
              '',
              style: TextStyle(color: Colors.grey[850]),
            ),
          ),
          centerTitle: true,
          bottom: _currentTab == 2
              ? TabBar(
                  indicatorColor: Colors.grey[850],
                  tabs: [
                    Tab(icon: Icon(Icons.movie, color: Colors.grey[850])),
                    Tab(icon: Icon(Icons.music_note, color: Colors.grey[850])),
                    Tab(icon: Icon(Icons.menu_book, color: Colors.grey[850])),
                  ],
                )
              : null,
        ),
        body: _tabs[_currentTab],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _onTabTapped,
          currentIndex: _currentTab,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Theme.of(context).accentColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: FlutterI18n.translate(context, 'homeWidget.blogWidget'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book),
              label: FlutterI18n.translate(context, 'homeWidget.bibleWidget'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.perm_media),
              label: FlutterI18n.translate(context, 'homeWidget.mediaWidget'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info),
              label: FlutterI18n.translate(context, 'homeWidget.infoWidget'),
            )
          ],
        ),
      ),
    );
  }

  void _onTabTapped(int index) {
    setState(() => _currentTab = index);
  }

  Future<void> _applyAppSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppTheme appTheme =
        AppTheme.values[prefs.getInt('appTheme') ?? AppTheme.System.index];
    switch (appTheme) {
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
    Language language =
        Language.values[prefs.getInt('language') ?? Language.System.index];
    switch (language) {
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
