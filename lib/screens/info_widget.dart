import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:dj/screens/settings_widget.dart';
import 'package:intl/intl.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 155.0,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/logo/icon-512x512.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Departamento da Juventude',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 6),
            Text(
              'dep.juventude@gmail.com',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 20),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: I18nText('infoWidget.labelTitleSettings'),
                    subtitle: I18nText('infoWidget.labelSubtitleSettings'),
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: SettingsWidget(),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !kIsWeb,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text('DJ Web'),
                      subtitle: Text('dj.web.app'),
                      onTap: () => launch('https://dj.web.app'),
                    ),
                  ),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: I18nText('infoWidget.labelTitleAbout'),
                        subtitle: Text(
                          snapshot.hasData
                              ? 'DJ ' + snapshot.data!.version
                              : 'DJ',
                        ),
                        onTap: () => _showAboutDialog(context),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showAboutDialog(BuildContext context) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return showAboutDialog(
      context: context,
      applicationIcon: Container(
        child: Image(
          image: AssetImage(
            'assets/images/logo/icon-192x192.png',
          ),
          fit: BoxFit.cover,
        ),
        height: 65,
        width: 65,
      ),
      applicationName: 'DJ',
      applicationVersion: packageInfo.version,
      applicationLegalese:
          '\u{00a9} ' + DateFormat('yyyy').format(DateTime.now()) + ' CBP',
      children: <Widget>[
        SizedBox(height: 20),
        I18nText(
          'infoWidget.aboutDialogText',
          child: Text(
            '',
            textAlign: TextAlign.center,
          ),
        ),
        GestureDetector(
          child: Text(
            'Convenção Baptista Portuguesa',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).accentColor,
            ),
            textAlign: TextAlign.center,
          ),
          onTap: () => launch('https://convencaobaptista.pt'),
        ),
        GestureDetector(
          child: Text(
            'convencao.b.portuguesa@gmail.com',
            style: TextStyle(
              decoration: TextDecoration.underline,
              color: Theme.of(context).accentColor,
            ),
            textAlign: TextAlign.center,
          ),
          onTap: () => launch('mailto:convencao.b.portuguesa@gmail.com'),
        ),
      ],
    );
  }
}
