import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:getwidget/getwidget.dart';

class Media {
  String? title;
  String? subTitle;
  String? banner;

  Media(this.title, this.subTitle, this.banner);
}

class MediaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        MoviesWidget(),
        MusicsWidget(),
        BooksWidget(),
      ],
    );
  }
}

class MoviesWidget extends StatelessWidget {
  final List<Media> movies = [
    Media(
      'Two by Two',
      '2015',
      'movie1.jpg',
    ),
    Media(
      'I Still Believe',
      '2020',
      'movie2.jpg',
    ),
    Media(
      'A Week Away',
      '2021',
      'movie3.jpg',
    ),
    Media(
      'The Case For Christ',
      '2017',
      'movie4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, i) {
          return GFCard(
            boxFit: BoxFit.cover,
            showImage: true,
            image: Image.asset(
              'assets/images/media/${movies[i].banner}',
            ),
            title: GFListTile(
              title: Text(
                movies[i].title!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              subTitle: Text(
                movies[i].subTitle!,
                style: TextStyle(fontSize: 14.5),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  child: I18nText(
                    'mediaWidget.moviesButton',
                    child: Text(
                      '',
                      style: TextStyle(color: Theme.of(context).canvasColor),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () => null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MusicsWidget extends StatelessWidget {
  final List<Media> musics = [
    Media(
      'Teach Me To Dance',
      'Jervis Campbell',
      'music1.jpg',
    ),
    Media(
      'O Come To The Altar',
      'Elevation Worship',
      'music2.jpg',
    ),
    Media(
      'Jesus Freak',
      'DC Talk',
      'music3.jpg',
    ),
    Media(
      'Ei-lo',
      'Samuel Úria',
      'music4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: musics.length,
        itemBuilder: (context, i) {
          return GFCard(
            boxFit: BoxFit.cover,
            showImage: true,
            image: Image.asset(
              'assets/images/media/${musics[i].banner}',
            ),
            title: GFListTile(
              title: Text(
                musics[i].title!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              subTitle: Text(
                musics[i].subTitle!,
                style: TextStyle(fontSize: 14.5),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  child: I18nText(
                    'mediaWidget.musicsButton',
                    child: Text(
                      '',
                      style: TextStyle(color: Theme.of(context).canvasColor),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () => null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class BooksWidget extends StatelessWidget {
  final List<Media> books = [
    Media(
      'O Chamado Para Líderes Cristãos',
      'John Stott',
      'book1.jpg',
    ),
    Media(
      'Génesis 1 e 2',
      'Adauto Lourenço',
      'book2.jpg',
    ),
    Media(
      'Humildade',
      'C.J. Mahaney',
      'book3.jpg',
    ),
    Media(
      'Isso Muda Tudo',
      'Jaquelle Crowe',
      'book4.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, i) {
          return GFCard(
            boxFit: BoxFit.cover,
            showImage: true,
            image: Image.asset(
              'assets/images/media/${books[i].banner}',
            ),
            title: GFListTile(
              title: Text(
                books[i].title!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              subTitle: Text(
                books[i].subTitle!,
                style: TextStyle(fontSize: 14.5),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  child: I18nText(
                    'mediaWidget.booksButton',
                    child: Text(
                      '',
                      style: TextStyle(color: Theme.of(context).canvasColor),
                    ),
                  ),
                  color: Theme.of(context).accentColor,
                  onPressed: () => null,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
