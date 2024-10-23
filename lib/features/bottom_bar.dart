import 'package:flutter/material.dart';
import 'package:petetco/commons/utils/app_style.dart';
import 'package:petetco/features/home/pages/home_screen.dart';
import 'package:petetco/features/pet/pages/listpet_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const ListPetScreen(),
    const Text("Profile"),
    const Text("Other")
  ];

void _onItemTapped(int index){
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home ),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.pets_outlined),
              activeIcon: Icon(Icons.pets),
              label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person_3),
              activeIcon: Icon(Icons.person_4),
              label: "Ticket"),
          BottomNavigationBarItem(icon: Icon(Icons.more),
              activeIcon: Icon(Icons.more)
              ,label: "Profile"),
      ])
    );
  }
}