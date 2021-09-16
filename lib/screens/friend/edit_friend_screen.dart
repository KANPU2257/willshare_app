import 'package:flutter/material.dart';
import '../../widgets/friend/friend_form.dart';
import '../../models/friend_model.dart';

class EditFriendScreen extends StatelessWidget {
  final FriendModel item;
  // ignore: use_key_in_widget_constructors
  const EditFriendScreen({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff747574),
      child: FriendForm(friendItems: item),
    );
  }
}
