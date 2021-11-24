import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend_model.dart';
import 'no_data.dart';
import '../../models/list_model.dart';
import '../cal/cal_tile.dart';

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
            title: 'กรุณาเพิ่มเพื่อนร่วมโต๊ะ\nและรายการอาหาร',
            details: 'สามารถทำได้ในรายการก่อนหน้า',
          )
        : ListView.builder(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  FriendTile(item: nameItems[index]),
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

