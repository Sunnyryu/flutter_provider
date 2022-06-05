import 'package:flutter/foundation.dart';

class Counter extends ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  // void clear() {
  //   counter = 0;
  //   notifyListeners();
  // }
}
