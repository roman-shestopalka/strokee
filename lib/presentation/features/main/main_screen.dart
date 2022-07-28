import 'package:flutter/material.dart';
import 'package:strokee/presentation/common/app_assets.dart';
import 'package:strokee/presentation/common/app_colors.dart';
import 'package:strokee/presentation/features/archive/achive_screen.dart';

import 'package:strokee/presentation/features/home/home_screen.dart';
import 'package:strokee/presentation/features/settings/settings_screen.dart';
import 'package:strokee/presentation/features/task/add_task_screen.dart';

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

  static final List<Widget> _widgetOptions = <Widget>[
    // app screens
    const HomeScreen(title: 'Home'),
    const ArchiveScreen(),
    const SettingsScreen(),
    const AddTaskScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xff101010), Color(0x009C9C9C)])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(194, 47, 47, 47),
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
            selectedItemColor: AppColors.mainColor,
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
