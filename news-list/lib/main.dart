import 'package:flutter/material.dart';

import 'model/news_model.dart';
import 'widget/news.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, // скрываем надпись debug
        home: Scaffold(
          appBar: AppBar(title: Text('News list')),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
              color: Colors.black12,
              child: Column(
                children: [
                  for (NewsModel nItem in _getData()) _getNewsWidgetItem(nItem)
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _getNewsWidgetItem(NewsModel news) => (news.image == null)
    ? NewsItemNoImageView(news.title, news.text)
    : NewsItemView(news.title, news.text, news.image);

List<NewsModel> _getData() => [
      NewsModel(10, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          image: Uri.parse(
              'https://image.winudf.com/v2/image1/dXMuQWR1bHRDb250ZW50LmdhbGxlcnkyX2ljb25fMTU2ODM4OTg0MV8wNzk/icon.png?w=250&fakeurl=1')),
      NewsModel(20, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          image: Uri.parse(
              'https://images-na.ssl-images-amazon.com/images/I/81NEEHwPSzL.png')),
      NewsModel(30, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
      NewsModel(40, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          image: Uri.parse(
              'https://www.beyourtruenorth.com/wp-content/uploads/bb-plugin/cache/girls-who-are-cutting-square.jpg')),
      NewsModel(50, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
      NewsModel(60, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          image: Uri.parse(
              'https://www.shethepeople.tv/wp-content/uploads/2020/05/alia-bhatt-condom-scene-e1590643708143.jpg')),
      NewsModel(70, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          image: Uri.parse(
              'https://image.shutterstock.com/image-photo/happy-friendsbeauty-portrait-young-girls-600w-640324351.jpg')),
      NewsModel(80, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.'),
      NewsModel(90, 'Lorem ipsum',
          text:
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
          image: Uri.parse(
              'https://image.shutterstock.com/image-photo/happy-women-celebrating-limousine-smiling-600w-105826979.jpg')),
    ];
