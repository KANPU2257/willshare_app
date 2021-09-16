import 'package:flutter/material.dart';
import 'package:student_app/widgets/menu/menu_form.dart';

// ignore: use_key_in_widget_constructors
class AddMenusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff747574),
      child: MenuForm(),
    );
  } 
}
