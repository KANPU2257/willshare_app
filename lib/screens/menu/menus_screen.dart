import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/list_model.dart';
import 'package:student_app/widgets/menu/menus_list.dart';
import 'add_menu_screen.dart';

// ignore: use_key_in_widget_constructors 
class MenusScreen extends StatefulWidget {
  @override
  _MenusScreenState createState() => _MenusScreenState();
}

class _MenusScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    ListModel objects = Provider.of<ListModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    child: Icon(
                      Icons.format_list_bulleted,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'รายการอาหาร',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade400,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'รายการอาหารทั้งหมด ${objects.menuItems.length} รายการ',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    // left: 40,
                    // right: 40,
                    top: 20,
                    bottom: 10,
                  ),
                  child: MenusList(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddMenusScreen(),
          );
        },
      ),
    );
  }
}
