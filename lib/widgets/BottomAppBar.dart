import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class BottomAppBar extends StatefulWidget {
  const BottomAppBar({Key? key}) : super(key: key);

  @override
  State<BottomAppBar> createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BottomAppBar> {
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    const BottomNavigationBarItem(
        icon: Icon(Icons.area_chart), label: "Charts"),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];
  var _selectedindex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.blueGrey,
      items: items,
      selectedFontSize: 15,
      selectedItemColor: Colors.grey,
      currentIndex: _selectedindex,
      onTap: _onItemTapped,
    );
  }
}
