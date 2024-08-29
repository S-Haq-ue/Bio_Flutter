import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  int _hoverIndex = -1;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  final List<GlobalKey> navBarKeyList = List.generate(5, (index) => GlobalKey());

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;
  ScrollController get scrollController => _scrollController;
  int get hoverIndex => _hoverIndex;

  set hoverIndex(int value) {
    _hoverIndex = value;
    notifyListeners();
  }

  void scrollControllerFunction(int index) {
    final key = navBarKeyList[index];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(
        milliseconds: 500,
      ),
      curve: Curves.easeInOut
    );
  }
}
