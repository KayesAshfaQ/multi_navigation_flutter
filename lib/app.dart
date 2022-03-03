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
  var _currentTab = TabItem.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabNavigator(
        navigatorKey: GlobalKey<NavigatorState>(),
        tabItem: _currentTab,
      ),
      bottomNavigationBar: BottomNavigation(
        currentTab: _currentTab,
        onSelectTab: _selectTab,
      ),
    );
  }

  void _selectTab(TabItem tabItem) {
    setState(() => _currentTab = tabItem);
  }

  Widget _buildBody() {
    return Container(
      color: activeTabColor[_currentTab],
      alignment: Alignment.center,
      child: FlatButton(
        child: const Text(
          'PUSH',
          style: TextStyle(fontSize: 32.0, color: Colors.white),
        ),
        onPressed: _push,
      ),
    );
  }

  void _push() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Container()));
  }
}
