import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../screen/discover_show_screen.dart';
import '../screen/home_screen.dart';
import '../screen/setting_screen.dart';


class CustomNavbar extends StatefulWidget {
  const CustomNavbar({super.key});

  @override
  State<CustomNavbar> createState() => _CustomNavbarState();
}

class _CustomNavbarState extends State<CustomNavbar> {
  int _page = 0;
  final List _screens = [
    const HomeScreen(),
    const DiscoverShowScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.easeInOutCirc,
        color: Colors.transparent,
        backgroundColor: const Color(0xFF1E1E1E),
        buttonBackgroundColor: const Color(0xFF2C81FB),
        height: 60,
        animationDuration: const Duration(milliseconds: 400),
        index: _page,
        items: const [
          Icon(Icons.home, size: 32, color: Colors.white),
          Icon(Icons.search_rounded, size: 32, color: Colors.white),
          // Icon(Icons.favorite, size: 32, color: Colors.white),
          Icon(Icons.settings, size: 32, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _screens[_page],
    );
  }
}
