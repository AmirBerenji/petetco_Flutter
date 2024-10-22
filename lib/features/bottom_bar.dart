import 'package:flutter/material.dart';
import 'package:petetco/features/home/pages/home_screen.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const  Text("Tickets"),
    const Text("Tickets"),
    const Text("Profile")
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        elevation: 10,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: const Color(0xFF526480),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home_max),
              label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.pets),
              activeIcon: Icon(Icons.pets_rounded),
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