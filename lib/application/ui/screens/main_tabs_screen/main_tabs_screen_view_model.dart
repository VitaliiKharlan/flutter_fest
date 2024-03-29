import 'package:flutter/material.dart';

class MainTabsScreenViewModel extends ChangeNotifier {
  var _currentTabIndex = 0;

  int get currentTabIndex => _currentTabIndex;

  void setCurrentTabIndex(int value) {
    _currentTabIndex = value;
    notifyListeners();
  }
}
