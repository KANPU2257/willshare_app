// Thapanapong 6210742257 kampoo456
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/screens/menu/menus_screen.dart';
import 'models/list_model.dart';
import 'screens/friend/friends_screen.dart';
import 'screens/cal/cal_screen.dart';

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
    CalculateScreen(),
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
    BottomNavigationBarItem(
      icon: Icon(Icons.calculate),
      label: 'Calculate',
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

// import 'package:flutter/material.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      
//       home: Scaffold(
//           appBar: AppBar(
          
            
//             title: Text("Multiple Checkbox Dynamically"),
//           ),
//           body: SafeArea(
//               child : Center(
//                 child:DynamicallyCheckbox(),
//               )
//           )
//       ),
//     );
//   }
// }

// class DynamicallyCheckbox extends StatefulWidget {
//   @override
//   DynamicallyCheckboxState createState() => new DynamicallyCheckboxState();
// }

// class DynamicallyCheckboxState extends State {

//   Map<String, bool> List = {
//     'Kampoo' : false,
//     'Chocolates' : false,
//     'Flour' : false,
//     'Fllower' : false,
//     'Fruits' : false,
//   };

//   var holder_1 = [];

//   getItems(){
//     List.forEach((key, value) {
//       if(value == true)
//       {
//         holder_1.add(key);
//       }
//     });
//     print(holder_1);
//     holder_1.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column (children: <Widget>[
//       Expanded(
//         child :
//         ListView(
//           children: List.keys.map((String key) {
//             return new CheckboxListTile(
//               title: new Text(key),
//               value: List[key],
//               activeColor: Colors.deepPurple[400],
//               checkColor: Colors.white,
//               onChanged: (value) {
//                 setState(() {
//                   List[key] = value!;
//                 });
//               },
//             );
//           }).toList(),
//         ),
//       ),]);
//   }
// }