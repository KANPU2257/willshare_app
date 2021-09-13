import 'package:flutter/material.dart';
import '../../models/friend/friend_model.dart';
import '../../screens/friend/edit_friend_screen.dart';

TextStyle kTileTextStyle = const TextStyle(
  color: Colors.pinkAccent,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);

class FriendTile extends StatelessWidget {
  final FriendModel friend;
  // ignore: use_key_in_widget_constructors
  const FriendTile({required this.friend});
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
        friend.name,
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
          builder: (context) => EditFriendScreen(
            friend: friend,
          ),
        );
      },
    );
  }
}
