import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_assets.dart';
import 'package:strokee/presentation/features/archive/achive_screen.dart';

import 'package:strokee/presentation/features/home/home_screen.dart';
import 'package:strokee/presentation/features/settings/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

// This screen should response only for:
// * background image
// * bottom navigation bar
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    // app screens
    HomeScreen(),
    ArchiveScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff00467F), Color(0xffA5CC82)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.grey,
            //selectedLabelStyle: AppTextStyle.navBarStyle,
            iconSize: 30,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icHomeAc)),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icArchiveAc)),
                label: 'Archive',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSettingsAc)),
                label: 'Settings',
              )
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.green,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
