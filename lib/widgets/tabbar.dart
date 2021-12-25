import 'package:flutter/material.dart';
import 'package:lost_animal/screens/advert_creation/advert_creation_screen.dart';
import 'package:lost_animal/screens/advert_list_screen/advert_list_screen.dart';
import 'package:lost_animal/screens/personal_info/profile_screen.dart';


class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    AdvertListScreen(),
    AdvertCreationScreen(), ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _widgetOptions = <Widget>[
        AdvertListScreen(),
        AdvertCreationScreen(), ProfileScreen()
      ];
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('BottomNavigationBar Sample'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF63B4FF),
        // backgroundColor:  Color(0xFF000066),
        selectedItemColor: Color(0xFFE5EFF3),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Advert',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
