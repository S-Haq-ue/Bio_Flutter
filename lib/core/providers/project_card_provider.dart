import 'package:flutter/material.dart';

class ProjectCardProvider extends ChangeNotifier {
  bool _isHovered = false;
  bool _isInfoHovered = false;

  bool get isHovered => _isHovered;
  bool get isInfoHovered => _isInfoHovered;

  bool get isCardActive => _isHovered || _isInfoHovered;

  void setHovered(bool value) {
    if (_isHovered != value) {
      _isHovered = value;
      notifyListeners();
    }
  }

  void setInfoHovered(bool value) {
    if (_isInfoHovered != value) {
      _isInfoHovered = value;
      notifyListeners();
    }
  }
}
