import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend_model.dart';
import '../../models/friend_model.dart';
import '../../models/list_model.dart';

TextStyle kTextFieldStyle = const TextStyle(
  decorationColor: Colors.red,
  color: Colors.blueGrey,
);

class CalForm extends StatefulWidget {
  final FriendModel? friendItems;
  // ignore: use_key_in_widget_constructors
  const CalForm({this.friendItems});
  @override
  _CalFormState createState() => _CalFormState();
}

class _CalFormState extends State<CalForm> {
  late bool isEditing;
  late TextEditingController nameController;
  late TextEditingController payController;
  late TextEditingController nameMenuController;
  late TextEditingController priceController;
  @override
  void initState() {
    super.initState();
    isEditing = false;
    nameController = TextEditingController();
    payController = TextEditingController();
    nameMenuController = TextEditingController();
    priceController = TextEditingController();
    if (widget.friendItems != null) {
      isEditing = true;
      nameController.text = widget.friendItems!.name;
      nameController.selection = TextSelection.fromPosition(
        TextPosition(offset: nameController.text.length),
      );
      payController.text = widget.friendItems!.pay.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    payController.dispose();
    nameMenuController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ListModel friendObjects = Provider.of<ListModel>(context);
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 0),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              isEditing
                  ? 'รายการอาหารของคุณ \n ${widget.friendItems!.name}'
                  : 'xxxxxxxxxxxxxxx',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Text(
              'Coke     ราคา     30 บาท',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Text(
              'หมูมะนาว     ราคา     30 บาท',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Text(
              'ปีกไก่ทอด     ราคา     24 บาท',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            Text(
              'รวมยอดที่ต้องจ่าย     ราคา     84 บาท',
              textAlign: TextAlign.left,
              style: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(
              color: Colors.blueGrey,
              indent: 20,
              endIndent: 20,
              height: 1,
            ),



            const SizedBox(
              height: 30,
            ),
            _buildButton(friendObjects),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(ListModel friendsObject) {
    final ButtonStyle style_capture = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.pinkAccent,
      minimumSize: Size(15, 5),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: style_capture,
          onPressed: () {
            if (isEditing) {
              friendsObject.addFriend(
                FriendModel(
                  idName: DateTime.now().toIso8601String(),
                  name: nameController.text,
                  pay: int.tryParse(payController.text) ?? 0,
                ),
              );
            } else {
              friendsObject.addFriend(
                FriendModel(
                  idName: DateTime.now().toIso8601String(),
                  name: nameController.text,
                  pay: int.tryParse(payController.text) ?? 0,
                ),
              );
            }
            Navigator.of(context).pop();
          },
          child: Text(
            isEditing ? 'Save' : 'Save',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
