import 'package:rx_notifier/rx_notifier.dart';
// import 'package:flutter/foundation.dart';

class MainController {
  final _counter = RxNotifier<int>(0);
  int get counter => _counter.value;
  set counter(int value) => _counter.value = value;

  incrementCounter() {
    _counter.value++;
  }
}
