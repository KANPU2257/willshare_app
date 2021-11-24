import 'package:flutter/material.dart';
import '../../models/friend_model.dart';
import '../../screens/cal/capture_cal_screen.dart';

TextStyle kTileTextStyle = const TextStyle(
  color: Colors.pinkAccent,
  fontSize: 18,
  fontWeight: FontWeight.w500,
);
class FriendTile extends StatelessWidget {
  final FriendModel item;
  // ignore: use_key_in_widget_constructors
  void main(){

  }
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
        item.name,
        style: kTileTextStyle,
      ),
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (context) => Capture(
            item: item,
          ),
        );
      },
    );
  }
}

class $ {
}
