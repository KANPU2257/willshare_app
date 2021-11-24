import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend_model.dart';
import 'no_data.dart';
import '../../models/list_model.dart';
import 'friends_tile.dart';

// ignore: use_key_in_widget_constructors
class FriendsList extends StatefulWidget {
  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  late List<FriendModel> nameItems;
  @override
  Widget build(BuildContext context) {
    ListModel nameObj = Provider.of<ListModel>(context);
    nameItems = nameObj.friendItems;
    // ignore: prefer_is_empty
    return nameItems.length == 0
        ? const NoDataScreen(
            title: 'ยังไม่มีรายชื่อเพื่อนร่วมโต๊ะ',
            details: 'เพิ่มรายชื่อเพื่อนร่วมโต๊ะโดยคลิกปุ่ม + ',
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Dismissible(
                    key: Key(nameItems[index].idName),
                    child: FriendTile(item: nameItems[index]),
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
                        nameObj.deleteFriend(nameItems[index]);
                        nameItems.removeAt(index);
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
            itemCount: nameItems.length,
          );
  }
}
