import 'package:flutter/material.dart';
import 'package:student_app/models/menu_model.dart';
import 'package:student_app/widgets/menu/menu_form.dart';

class EditMenuScreen extends StatelessWidget {
  final MenuModel item;
  // ignore: use_key_in_widget_constructors
  const EditMenuScreen({required this.item});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff747574),
      child: MenuForm(menuItems: item),
    );
  }
}
