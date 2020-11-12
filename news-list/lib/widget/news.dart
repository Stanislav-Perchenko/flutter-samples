import 'package:flutter/material.dart';

class NewsItemView extends StatelessWidget {

  final String _title;
  final String _text;
  final Uri _image;


  NewsItemView(this._title, this._text, this._image);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
    child: Container(
        color: Colors.black12,
        height: 100.0,
        child: Row(
            children: [
              Image.network(_image.toString(), width: 100.0, height: 100.0, fit: BoxFit.cover),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5.0),
                      child: Column(
                          children: [
                            Text(_title,  style: TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
                            Expanded(
                                child:Text(_text, softWrap: true, textAlign: TextAlign.justify,)
                            )
                          ]
                      )
                  )
              )
            ]
        )
    ),
  );
}

class NewsItemNoImageView extends StatelessWidget {

  final String _title;
  final String _text;

  NewsItemNoImageView(this._title, this._text);

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.fromLTRB(0, 4, 0, 4),
    child: Container(
        color: Colors.black12,
        height: 100.0,
        child: Expanded(
            child: Container(
                padding: EdgeInsets.all(5.0),
                child: Column(
                    children: [
                      Text(_title, style: TextStyle(fontSize: 20.0), overflow: TextOverflow.ellipsis),
                      Expanded(
                          child: Text(_text, softWrap: true, textAlign: TextAlign.justify,)
                      )
                    ]
                )
            )
        )
    ),
  );
}