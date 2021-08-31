import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:getwidget/getwidget.dart';

class Article {
  String? title;
  String? subTitle;
  String? content;
  String? banner;

  Article(this.title, this.subTitle, this.content, this.banner);
}

class BlogWidget extends StatelessWidget {
  final List<Article> articles = [
    Article(
      'Acampamento de Jovens 2021',
      '8 de junho de 2021',
      'Este ano o DJ vai ter dois, sim, 2 Acampamentos! 🎊\nDevido à '
          'pandemia e para evitar grandes ajuntamentos fez-se esta divisão '
          'que acabará por trazer as suas vantagens! 😎',
      'banner1.jpg',
    ),
    Article(
      'Postal de Natal',
      '17 de dezembro de 2020',
      'O DJ PRECISA DA TUA AJUDA! O DJ vai fazer um mega postal de Natal com '
          'a participação de vários jovens do país, mas para isso precisamos '
          'da tua ajuda! Como é que podes fazer isso? É fácil!',
      'banner2.jpg',
    ),
    Article(
      'Congresso DJ 2020',
      '4 de novembro de 2020',
      'Como é do conhecimento da malta, teremos o nosso Congresso a '
          'acontecer no dia 01 de Dezembro, presencialmente (no AB) e '
          'online (no Zoom), a fim de podermos fazer o Congresso da forma '
          'mais preventiva e participativa possível. Queres saber mais?',
      'banner3.jpg',
    ),
    Article(
      'Encontro Nacional 5 de Outubro',
      '24 de setembro de 2020',
      'Ah pois é...! Vamos ter o Encontro Nacional 5 de Outubro...! Só que '
          'será Online (será um E-Encontro), com o tema "Permanecer no '
          'Caminho". Para participares, precisaremos, na mesma, que te '
          'inscrevas para o evento até dia 02 de Outubro no link que se '
          'encontra na BIO do nosso Insta.',
      'banner4.jpg',
    ),
    Article(
      'E-Camp Jovens 2020',
      '15 de setembro de 2020',
      'E finalmente apresentamos o tema e título do nosso E-camp Jovens '
          '2020: "Um Caminho Sobremodo EXCELENTE"! Onde vamos poder abordar, '
          'discutir e aprender sobre relacionamentos em várias áreas da '
          'nossa vida, conforme aquilo que a Bíblia nos diz.',
      'banner5.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, i) {
          return GFCard(
            boxFit: BoxFit.cover,
            showImage: true,
            image: Image.asset(
              'assets/images/blog/${articles[i].banner}',
            ),
            title: GFListTile(
              title: Text(
                articles[i].title!,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              subTitle: Text(
                articles[i].subTitle!,
                style: TextStyle(fontSize: 14.5),
              ),
              margin: EdgeInsets.symmetric(vertical: 8),
            ),
            content: Text(articles[i].content!),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  child: I18nText(
                    'blogWidget.articleButton',
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
