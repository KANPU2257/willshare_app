import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend_model.dart';
import 'package:student_app/models/menu_model.dart';
import '../../models/list_model.dart';
TextStyle kTextFieldStyle = const TextStyle(
  decorationColor: Colors.red,
  color: Colors.blueGrey,
);

class MenuForm extends StatefulWidget {
  final MenuModel? menuItems;
  // ignore: use_key_in_widget_constructors
  const MenuForm({this.menuItems});
  @override
  _MenuFormState createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  late List<FriendModel> x;
  Map<String, bool> lF = {
    'Kampoo': false,
    'Aom': false,
    'Pon': false,
    'Peeter': false,
    'Jame': false,
  };

  var holder_1 = [];

  getItems() {
    lF.forEach((key, value) {
      if (value == true) {
        holder_1.add(key);
      }
    });
    print(holder_1);
    holder_1.clear();
  }

  late List<FriendModel> nameItems;
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
    if (widget.menuItems != null) {
      isEditing = true;
      nameMenuController.text = widget.menuItems!.nameMenu;
      nameMenuController.selection = TextSelection.fromPosition(
        TextPosition(offset: nameMenuController.text.length),
      );
      priceController.text = widget.menuItems!.price.toString();
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
    ListModel menuObjects = Provider.of<ListModel>(context);
    /////////////////////
    ListModel nameObj = Provider.of<ListModel>(context);
    nameItems = nameObj.friendItems;
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
              isEditing ? widget.menuItems!.nameMenu : 'เพิ่มรายการอาหาร',
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'รายการอาหาร',
                focusColor: Colors.pink,
                labelStyle: kTextFieldStyle,
                icon: const Icon(
                  Icons.restaurant,
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
              controller: nameMenuController,
              autofocus: true,
              autocorrect: false,
              style: kTextFieldStyle,
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'ราคา',
                focusColor: Colors.pink,
                labelStyle: kTextFieldStyle,
                icon: const Icon(
                  Icons.payment,
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
              controller: priceController,
              keyboardType: TextInputType.number,
              style: kTextFieldStyle,
            ),
            const SizedBox(
              height: 10,
            ),
            const SizedBox(height: 20),
            // Check-Box friends
            Text(
              'เพิ่มเพื่อน',
              style: const TextStyle(
                color: Colors.pinkAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: ListView(
                children: lF.keys.map((String key) {
                  return new CheckboxListTile(
                    title: new Text(key,
                        style: const TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16,
                        )),
                    value: lF[key],
                    activeColor: Colors.pinkAccent,
                    checkColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        lF[key] = value!;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
            
            _buildButton(menuObjects),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(
    ListModel menusObject,
  ) {
    final ButtonStyle style_cancel = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.blueGrey,
      minimumSize: Size(15, 5),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
    );

    final ButtonStyle style_add = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.pinkAccent,
      minimumSize: Size(15, 5),
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 20, right: 20),
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
              menusObject.editMenu(
                MenuModel(
                  idMenu: widget.menuItems!.idMenu,
                  nameMenu: nameMenuController.text,
                  price: int.tryParse(priceController.text) ?? 0,
                  // edit friends lsit
                ),
              );
            } else {
              menusObject.addMenu(
                MenuModel(
                  idMenu: DateTime.now().toIso8601String(),
                  nameMenu: nameMenuController.text,
                  price: int.tryParse(priceController.text) ?? 0,
                  // add friends lsit
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
