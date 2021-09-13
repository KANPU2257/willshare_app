import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend/friends_list_model.dart';
import '../../models/friend/friend_model.dart';
import '../../models/friend/friends_list_model.dart';

TextStyle kTextFieldStyle = const TextStyle(
  decorationColor: Colors.red,
  color: Colors.blueGrey,
);

class FriendForm extends StatefulWidget {
  final FriendModel? friends;
  // ignore: use_key_in_widget_constructors
  const FriendForm({this.friends});
  @override
  _FriendFormState createState() => _FriendFormState();
}

class _FriendFormState extends State<FriendForm> {
  late bool isEditing;
  late TextEditingController nameController;
  late TextEditingController ageController;
  @override
  void initState() {
    super.initState();
    isEditing = false;
    nameController = TextEditingController();
    ageController = TextEditingController();
    if (widget.friends != null) {
      isEditing = true;
      nameController.text = widget.friends!.name;
      nameController.selection = TextSelection.fromPosition(
        TextPosition(offset: nameController.text.length),
      );
      ageController.text = widget.friends!.pay.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FriendsListModel friendsObject = Provider.of<FriendsListModel>(context);
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
              isEditing ? widget.friends!.name : 'เพิ่มเพื่อนร่วมโต๊ะ',
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'ชื่อ',
                focusColor: Colors.pink,
                labelStyle: kTextFieldStyle,
                icon: const Icon(
                  Icons.person_outline,
                  color: Colors.blueGrey,
                ),
                fillColor: Colors.blueGrey,
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.pinkAccent),
                ),
              ),
              controller: nameController,
              autofocus: true,
              autocorrect: false,
              style: kTextFieldStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: 'อายุ',
            //     focusColor: Colors.pink,
            //     labelStyle: kTextFieldStyle,
            //     icon: const Icon(
            //       Icons.drive_file_rename_outline,
            //       color: Colors.blueGrey,
            //     ),
            //     fillColor: Colors.blueGrey,
            //     enabledBorder: const UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.blueGrey),
            //     ),
            //     focusedBorder: const UnderlineInputBorder(
            //       borderSide: BorderSide(color: Colors.pinkAccent),
            //     ),
            //   ),
            //   controller: ageController,
            //   keyboardType: TextInputType.number,
            //   style: kTextFieldStyle,
            // ),
            // const SizedBox(
            //   height: 30,
            // ),
            _buildButton(friendsObject),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(FriendsListModel friendsObject) {
    final ButtonStyle style_cancel = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.blueGrey,
      minimumSize: Size(15, 5),
      padding: const EdgeInsets.only(top: 5, bottom: 5,left: 20, right: 20),
    );

    final ButtonStyle style_add = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.pinkAccent,
      minimumSize: Size(15, 5),
      padding: const EdgeInsets.only(top: 5, bottom: 5,left: 20, right: 20),
    );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          style: style_cancel,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'ยกเลิก',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          
        ),
        ElevatedButton(
          style: style_add,
          onPressed: () {
            if (isEditing) {
              friendsObject.editFriend(
                FriendModel(
                  id: widget.friends!.id,
                  name: nameController.text,
                  pay: int.tryParse(ageController.text) ?? 0,
                ),
              );
            } else {
              friendsObject.addFriends(
                FriendModel(
                  id: DateTime.now().toIso8601String(),
                  name: nameController.text,
                  pay: int.tryParse(ageController.text) ?? 0,
                ),
              );
            }
            Navigator.of(context).pop();
          },
          child: Text(
            isEditing ? 'แก้ไข' : 'เพิ่ม',
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
