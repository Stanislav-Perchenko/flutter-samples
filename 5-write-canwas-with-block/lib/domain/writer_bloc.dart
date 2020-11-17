import 'dart:async';
import 'package:flutter/material.dart';

import 'remove_event.dart';

class WriterBloc with ChangeNotifier {
  int _nDrawings = 0;


  final _removeEventController = StreamController<RemoveEvent>();
  Sink<RemoveEvent> _removeEventSink;
  Stream<RemoveEvent> _removeEventStream;

  Stream<RemoveEvent> get removeEventStream => _removeEventStream;

  WriterBloc() {
    _removeEventSink = _removeEventController.sink;
    _removeEventStream = _removeEventController.stream.asBroadcastStream();

    _removeEventStream.listen((event) {
      print('Bloc remove listener - $event');
      switch(event) {
        case RemoveEvent.REMOVE_LAST:
          if (_nDrawings > 0) {
            _nDrawings --;
            notifyListeners();
          }
          break;
        case RemoveEvent.REMOVE_ALL:
          if (_nDrawings > 0) {
            _nDrawings = 0;
            notifyListeners();
          }
          break;
      }
    });
  }


  int get numDrawings => _nDrawings;

  bool get isHasDrawing => (numDrawings > 0);

  @override
  void dispose() {
    super.dispose();
    _removeEventController.close();
  }

  void addDrawing() {
    _nDrawings ++;
    notifyListeners();
  }

  void removeLastDrawing() {
    print('Bloc action - ${RemoveEvent.REMOVE_LAST}');
    _removeEventSink.add(RemoveEvent.REMOVE_LAST);
  }

  void clearCanvas() {
    print('Bloc action - ${RemoveEvent.REMOVE_ALL}');
    _removeEventSink.add(RemoveEvent.REMOVE_ALL);
  }




}