import 'package:flutter/material.dart';
import 'package:student_app/models/friend_model.dart';
import 'package:student_app/models/menu_model.dart';
import 'package:student_app/screens/menu/edit_menu_screen.dart';

TextStyle kTileTextStyle = const TextStyle(
  color: Colors.pinkAccent,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

class FriendTile extends StatelessWidget {
  final MenuModel item;
  // ignore: use_key_in_widget_constructors
  const FriendTile({required this.item});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 60,
        right: 60,
        top: 0,
        bottom: 0,
      ),
      title: Text(
        item.nameMenu,
        style: kTileTextStyle,
      ),
      // trailing: Text(
      //   friend.pay.toString(),
      //   style: kTileTextStyle,
      // ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => EditMenuScreen(
            item: item,
          ),
        );
      },
    );
  }
}
