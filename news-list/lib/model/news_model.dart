class NewsModel {
  final int _id;
  final String _title;
  final String _text;
  final Uri _image;

  NewsModel(int id, String title, {String text, Uri image}): _id = id, _title = title, _text = text, _image = image;

  int get id => _id;

  String get title => _title;

  String get text => _text;

  Uri get image => _image;
}