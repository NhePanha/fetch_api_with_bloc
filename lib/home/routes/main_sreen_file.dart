import 'package:auth_with_api/home/file_acounts/acounts_file.dart';
import 'package:auth_with_api/home/file_cart/cart_file.dart';
import 'package:auth_with_api/home/file_expore/expore_file.dart';
import 'package:auth_with_api/home/file_home_screen/home_screen_file.dart';
import 'package:auth_with_api/model/file_product_list.dart';
import 'package:flutter/material.dart';
class Routes extends StatefulWidget {
  @override
  _RoutesState createState() => _RoutesState();
}
class _RoutesState extends State<Routes> {
  int _selectedIndex = 0;

  // List of screens by index
  final List<Widget> _screens = [
    // HomeScreenFile(productList: ),
    HomeScreenFile(),
    expore_file(), 
    cart_file(), 
    acounts_file(), 
    
  ];
  // On item tapped, update index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],// Get screen by index
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Set new index
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
