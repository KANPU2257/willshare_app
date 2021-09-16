// Thapanapong 6210742257 kampoo456
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/screens/menu/menus_screen.dart';
import 'models/list_model.dart';
import 'screens/friend/friends_screen.dart';

void main() {
    runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListModel(friendItems: [], menuItems: []),
      builder: (_, __) => MaterialApp(
        home: Launcher(),
        theme: ThemeData.dark(),
      ),
    );
  }
}

class Launcher extends StatefulWidget {
  // static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    FriendsScreen(),
    MenusScreen(),
  ];
  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.person_add),
      label: 'Add Friends',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.format_list_bulleted),
      label: 'Menu List',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey.shade400,
        onTap: _onItemTapped,
      ),
    );
  }
}

/*
// Thapanapong 6210742257 kampu
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/menu/menus_list_model.dart';
import 'package:student_app/screens/menu/menus_screen.dart';
import 'models/friend/friends_list_model.dart';
import 'models/menu/menus_list_model.dart';
import 'screens/friend/friends_screen.dart';

void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Launcher(),
      theme: ThemeData.dark(),
    );
  }
}

class Launcher extends StatefulWidget {
  // static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _LauncherState();
  }
}

class _LauncherState extends State<Launcher> {
  int _selectedIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    ChangeNotifierProvider(
      create: (context) => FriendsListModel(friends: []),
      builder: (_, __) => MaterialApp(
        home: FriendsScreen(),
        theme: ThemeData.dark(),
      ),
    ),
    ChangeNotifierProvider(
      create: (context) => MenusListModel(menus: []),
      builder: (_, __) => MaterialApp(
        home: MenusScreen(),
        theme: ThemeData.dark(),
      ),
    ),
  ];
  List<BottomNavigationBarItem> _menuBar = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.person_add),
      label: 'Add Friends',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.format_list_bulleted),
      label: 'Menu List',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey.shade400,
        onTap: _onItemTapped,
      ),
    );
  }
}
*/