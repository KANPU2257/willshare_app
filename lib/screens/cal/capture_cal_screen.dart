import 'package:flutter/material.dart';
import '../../widgets/cal/cal_form.dart';
import '../../models/friend_model.dart';

class Capture extends StatelessWidget {
  final FriendModel item;
  // ignore: use_key_in_widget_constructors
  const Capture({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container( 
      color: const Color(0xff747574),
      child: CalForm(friendItems: item),
    );
  }
}
