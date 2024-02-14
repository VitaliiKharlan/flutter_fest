import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/screens/main_tabs_screen/main_tabs_screen.dart';
import 'package:flutter_fest/'
    'application/ui/screens/main_tabs_screen/main_tabs_screen_view_model.dart';
import 'package:flutter_fest/'
    'application/ui/screens/session_details_screen.dart';
import 'package:provider/provider.dart';

class ScreenFactory {
  Widget makeMainTabs() => ChangeNotifierProvider(
    create: (_) => MainTabsScreenViewModel(),
    child: const MainTabsScreen(),
  );

  Widget makeSessionDetails() => const SessionDetailsScreen();

//     ChangeNotifierProvider(
//   create: (_) => MainTabsScreenViewModel(),
//   child: const MainTabsScreen(),
// );
}
