import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CommonProvider extends ChangeNotifier {
  CommonProvider() {
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }
  int _hoverIndex = -1;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScrollController _scrollController;
  bool _isScrolling = false;

  final List<GlobalKey> navBarKeyList = List.generate(5, (index) => GlobalKey());

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  ScrollController get scrollController => _scrollController;
  int get hoverIndex => _hoverIndex;
  bool get isScrolling => _isScrolling;

  set hoverIndex(int value) {
    _hoverIndex = value;
    notifyListeners();
  }

  void scrollControllerFunction(int index) {
    final key = navBarKeyList[index];
    Scrollable.ensureVisible(key.currentContext!,
        duration: const Duration(
          milliseconds: 500,
        ),
        curve: Curves.easeInOut);
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      _isScrolling = true;
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      _isScrolling = false;
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.idle) {
      _isScrolling = false;
    }
    notifyListeners();
  }
}
