import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trolley/drawer_menu.dart';
import 'package:trolley/pages/home_page.dart';
import 'package:trolley/pages/list_page.dart';
import 'package:trolley/pages/favourites_page.dart';
import 'package:trolley/search_bar.dart';

import 'colours.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<String> titles = ['Home','List', 'Favourites'];
  static const List<Icon> icons = [Icon(Icons.home), Icon(Icons.list), Icon(Icons.favorite)];
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ListPage(),
    FavouritesPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: AppBar(systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colours.primary,
          ),
            elevation: 0
          )
      ),
      body: Column(
          children: [
            const SearchBar(),
            Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
          ]),
      drawer: const DrawerMenu(),
      bottomNavigationBar: BottomNavigationBar(
        items: titles.map((element) {
          return BottomNavigationBarItem(icon: icons[titles.indexOf(element)], label: element);
        }).toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
