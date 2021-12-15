import 'package:lost_animal/screens/advert_creation/advert_creation_screen.dart';
import 'package:lost_animal/screens/advert_list_screen/advert_list_screen.dart';
import 'package:lost_animal/screens/personal_info/profile_screen.dart';
import 'package:flutter/material.dart';

class TabsBarScreen extends StatefulWidget {
  @override
  _TabsBarScreenState createState() => _TabsBarScreenState();
}

class _TabsBarScreenState extends State<TabsBarScreen> {
  int _currentIndex = 0;

  List<GlobalKey<NavigatorState>> navKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          final firstPage =
              !await navKeys[_currentIndex].currentState.maybePop();
          return firstPage;
        },
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.green,
            selectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                title: Text('Home'),
                activeIcon: Icon(
                  Icons.home,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add,
                ),
                title: Text('New Item'),
                activeIcon: Icon(
                  Icons.add,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                title: Text('User Profile'),
                activeIcon: Icon(
                  Icons.person,
                ),
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          body: Stack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
            ],
          ),
        ));
  }

  Map<String, WidgetBuilder> _routes(BuildContext context, int index) {
    return {
      '/': (context) {
        return [AdvertListScreen(), AdvertCreationScreen(), ProfileScreen()]
            .elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routes = _routes(context, index);
    return Offstage(
      offstage: _currentIndex != index,
      child: Navigator(
          key: navKeys[index],
          onGenerateRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => routes[routeSettings.name](context),
            );
          }),
    );
  }
}
