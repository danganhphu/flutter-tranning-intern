import 'dart:async';

import 'package:flutter/widgets.dart';

import 'base_event.dart';

abstract class BaseBloc {
  final StreamController<BaseEvent> _eventStreamCtrl = StreamController<BaseEvent>();
  Sink<BaseEvent> get event => _eventStreamCtrl.sink;

  BaseBloc() {
    _eventStreamCtrl.stream.listen((event) {
      if (event is! BaseEvent) {
        throw Exception('Even khong hop le');
      }
      dispatchEvent(event);
    });
  }

  void dispatchEvent(BaseEvent event);

  @mustCallSuper
  void dispose() {
    _eventStreamCtrl.close();
  }
}