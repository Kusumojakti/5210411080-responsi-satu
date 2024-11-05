import 'package:flutter/material.dart';
import 'package:responsi_satu/app/modules/akun_view.dart';
import 'package:responsi_satu/app/modules/home_view.dart';
import 'package:responsi_satu/app/modules/logout_view.dart';

class ParentTab extends StatefulWidget {
  const ParentTab({super.key});

  @override
  State<ParentTab> createState() => _ParentTabState();
}

class _ParentTabState extends State<ParentTab> {
  int _selectedIndex = 0;
  final List<Widget> _views = [
    const HomeView(),
    const AkunView(),
    const LogoutView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _views,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: const Color(0xffE8DEF8),
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.stars),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.stars),
          label: 'Akun',
        ),
          NavigationDestination(
            icon: Icon(Icons.stars),
            label: 'Logout',
          ),
      ]),
    );
  }
}
