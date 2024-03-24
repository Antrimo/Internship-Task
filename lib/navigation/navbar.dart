import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

import 'package:task/Screens/home.dart';
import 'package:task/Screens/profile.dart';
import 'package:task/color/theme.dart';

class Nav extends StatefulWidget {
  const Nav({super.key});

  @override
  State<Nav> createState() => _NavState();
}

class _NavState extends State<Nav> {
  final List<Widget> pages = [
    const Home(),
    const Profile(),
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: pages[currentPage],
        bottomNavigationBar: Container(
          color: splash,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: GNav(
              backgroundColor: splash,
              gap: 8,
              activeColor: Colors.white,
              color: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              duration: const Duration(milliseconds: 800),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  iconSize: 30.0,
                ),
                GButton(
                  key: Key('profile'),
                  icon: Icons.people,
                  iconSize: 30.0,
                ),
              ],
              selectedIndex: currentPage,
              onTabChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
