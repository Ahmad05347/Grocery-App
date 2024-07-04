import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/pages/cart/cart_screen.dart';
import 'package:grocery_app/pages/categories.dart';
import 'package:grocery_app/pages/homepage.dart';
import 'package:grocery_app/pages/settings_page.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> pages = [
    {"pages": const HomePage(), "title": "HOMEPAGE"},
    {"pages": Categories(), "title": "CATEGORIES"},
    {"pages": const CartScreen(), "title": "CART"},
    {"pages": const SettingsPage(), "title": "SETTINGS"},
  ];
  void _selectedPages(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(pages[_selectedIndex]["title"]),
      // ),
      body: pages[_selectedIndex]["pages"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
        unselectedItemColor: _isDark ? Colors.blueGrey[800] : Colors.black12,
        selectedItemColor: _isDark ? Colors.blueGrey : Colors.black87,
        onTap: _selectedPages,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 1
                  ? IconlyBold.category
                  : IconlyLight.category),
              label: "CATEGORIES"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 2
                  ? IconlyBold.discount
                  : IconlyLight.discount),
              label: "CART"),
          BottomNavigationBarItem(
              icon: Icon(_selectedIndex == 3
                  ? IconlyBold.setting
                  : IconlyLight.setting),
              label: "SETTINGS"),
        ],
      ),
    );
  }
}
