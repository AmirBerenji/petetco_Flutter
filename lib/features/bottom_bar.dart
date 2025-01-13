import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/auth/pages/profile_screen.dart';
import 'package:petetco/features/home/pages/home_screen.dart';
import 'package:petetco/features/pet/pages/listpet_screen.dart';

class BottomBar extends StatefulWidget {
  static final mainPageKey = GlobalKey<_BottomBarState>();

  BottomBar() : super(key: mainPageKey);

  //const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  void navigateTo(int id) {
    _onItemTapped(id); // Set index to 1 to go to Profile
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ListPetScreen(),
    const ProfileScreen(),
    const Text("Other")
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: _widgetOptions[_selectedIndex]),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Styles.grey300,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            elevation: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: Styles.green900,
            unselectedItemColor: Styles.green900,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Styles.grey700,
                  ),
                  activeIcon: Icon(
                    Icons.home,
                    color: Styles.green900,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pets,
                    color: Styles.grey700,
                  ),
                  activeIcon: Icon(
                    Icons.pets,
                    color: Styles.green900,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    color: Styles.grey700,
                  ),
                  activeIcon: Icon(
                    Icons.person,
                    color: Styles.green900,
                  ),
                  label: "Ticket"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.more,
                    color: Styles.grey700,
                  ),
                  activeIcon: Icon(
                    Icons.more,
                    color: Styles.green900,
                  ),
                  label: "More Option"),
            ]));
  }
}
