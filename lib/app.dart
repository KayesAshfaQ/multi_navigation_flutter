import 'package:flutter/material.dart';
import 'package:multi_navigation_flutter/bottom_navigation_bar.dart';
import 'package:multi_navigation_flutter/tab_item.dart';
import 'package:multi_navigation_flutter/tab_navigator.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  TabItem _currentTab = TabItem.red;

  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeys = {
    TabItem.red: GlobalKey<NavigatorState>(),
    TabItem.green: GlobalKey<NavigatorState>(),
    TabItem.blue: GlobalKey<NavigatorState>(),
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final bool isFirstRouteInCurrentTab =
            !await _navigatorKeys[_currentTab]!.currentState!.maybePop();
        if (isFirstRouteInCurrentTab) {
          // if not on the 'main' tab
          if (_currentTab != TabItem.red) {
            // select 'main' tab
            _selectTab(TabItem.red);
            // back button handled by app
            return false;
          }
        }
        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
        //return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            _buildOffstageNavigator(TabItem.red),
            _buildOffstageNavigator(TabItem.green),
            _buildOffstageNavigator(TabItem.blue),
          ],
        ),
        bottomNavigationBar: BottomNavigation(
          currentTab: _currentTab,
          onSelectTab: _selectTab,
        ),
      ),
    );
  }

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  Widget _buildOffstageNavigator(TabItem tabItem) {
    return Offstage(
      offstage: _currentTab != tabItem,
      child: TabNavigator(
        navigatorKey: _navigatorKeys[tabItem]!,
        tabItem: tabItem,
      ),
    );
  }
}
