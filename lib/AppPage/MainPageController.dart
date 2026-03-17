import 'package:flutter/material.dart';

import 'Homepage.dart';
import 'ProfilePage.dart';
import 'SearchPage.dart';
import 'ShoppingPage.dart';

class Mainpagecontroller extends StatefulWidget {
  Mainpagecontroller({super.key});
  final List<Widget> Page = [
    Homepage(),
    Searchpage(),
    Shoppingpage(),
    Profilepage(),
  ];
  @override
  State<Mainpagecontroller> createState() => _MainpagecontrollerState();
}

class _MainpagecontrollerState extends State<Mainpagecontroller> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: widget.Page),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade200,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Serach"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: "Shopping",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
