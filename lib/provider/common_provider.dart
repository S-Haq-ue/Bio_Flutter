import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  int _hoverIndex = -1;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  int get hoverIndex => _hoverIndex;

  set hoverIndex(int value) {
    _hoverIndex = value;
    notifyListeners();
  }
}
