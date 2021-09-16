import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend_model.dart';
import 'package:student_app/models/list_model.dart';
import 'package:student_app/models/menu_model.dart';
import 'no_data.dart';
import 'menus_tile.dart';

// ignore: use_key_in_widget_constructors
class MenusList extends StatefulWidget {
  @override
  _MenusListState createState() => _MenusListState();
}

class _MenusListState extends State<MenusList> {
  late List<MenuModel> items;
  @override
  Widget build(BuildContext context) {
    ListModel objects = Provider.of<ListModel>(context);
    items = objects.menuItems;
    // ignore: prefer_is_empty
    return items.length == 0
        ? const NoDataScreen(
            title: 'ยังไม่มีรายการอาหาร',
            details: 'เพิ่มรายการอาหารโดยคลิกปุ่ม + ',
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Dismissible(
                    key: Key(items[index].idMenu),
                    child: FriendTile(item: items[index]),
                    background: Container(
                      padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                      child: Text(
                        'ลบ',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          
                        ),
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.pinkAccent,
                      ),
                    ),
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        objects.deleteMenu(items[index]);
                        items.removeAt(index);
                      }
                    },
                    direction: DismissDirection.endToStart,
                  ),
                  const Divider(
                    color: Colors.blueGrey,
                    indent: 20,
                    endIndent: 20,
                    height: 1,
                  ),
                ],
              );
            },
            itemCount: items.length,
          );
  }
}
