import 'package:flutter/material.dart';
import 'package:flutter_fest/'
    'application/ui/screens/favorite_screen.dart';
import 'package:flutter_fest/'
    'application/ui/screens/location_screen.dart';
import 'package:flutter_fest/'
    'application/ui/screens/main_tabs_screen/main_tabs_screen_view_model.dart';

import 'package:flutter_fest/application/ui/screens/schedule_screen.dart';
import 'package:flutter_fest/'
    'images.dart';
import 'package:provider/provider.dart';

class MainTabsScreen extends StatelessWidget {
  const MainTabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _BodyWidget(),
      bottomNavigationBar: _NavigationBarWidget(),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.select(
          (MainTabsScreenViewModel vm) => vm.currentTabIndex,
    );

    return IndexedStack(
      index: currentIndex,
      children: const [
        ScheduleWidget(),
        FavoriteScreen(),
        LocationScreen(),
      ],
    );
  }
}

class _NavigationBarWidget extends StatelessWidget {
  const _NavigationBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.read<MainTabsScreenViewModel>();
    final currentIndex = context.select(
          (MainTabsScreenViewModel vm) => vm.currentTabIndex,
    );

    final theme = Theme.of(context).bottomNavigationBarTheme;
    final buttons = [
      _BottomNavigationBarItemFactory(
          AppImages.bottomNavigationBarIconLeft, 'Schedule'),
      _BottomNavigationBarItemFactory(
          AppImages.bottomNavigationBarIconMiddle, 'Favorites'),
      _BottomNavigationBarItemFactory(
          AppImages.bottomNavigationBarIconRight, 'How to get'),
    ]
        .asMap()
        .map((index, value) {
      return MapEntry(index, value.build(index, currentIndex, theme));
    })
        .values
        .toList();

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: model.setCurrentTabIndex,
      items: buttons,
    );
  }

  BottomNavigationBarItem _makeButton(
      String iconName,
      String tooltip,
      int index,
      int currentIndex,
      BottomNavigationBarThemeData theme,
      ) {
    final color = index == currentIndex
        ? theme.selectedItemColor
        : theme.unselectedItemColor;
    return BottomNavigationBarItem(
      label: '',
      tooltip: tooltip,
      icon: Image.asset(
        iconName,
        color: color,
      ),
    );
  }
}

class _BottomNavigationBarItemFactory {
  final String iconName;
  final String tooltip;

  _BottomNavigationBarItemFactory(
      this.iconName,
      this.tooltip,
      );

  BottomNavigationBarItem build(
      int index,
      int currentIndex,
      BottomNavigationBarThemeData theme,
      ) {
    final color = index == currentIndex
        ? theme.selectedItemColor
        : theme.unselectedItemColor;
    return BottomNavigationBarItem(
      label: '',
      tooltip: tooltip,
      icon: Column(
        children: [
          const SizedBox(height: 8),
          SizedBox(
            height: 32,
            width: 32,
            child: Image.asset(
              iconName,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
