

import 'package:flutter/material.dart';

class CarouselController extends ChangeNotifier {
  double _dotPosition = 0;
  double get dotPosition => _dotPosition;


  set currentPosition(double value) {
    _dotPosition = value;
    notifyListeners();

  }

}