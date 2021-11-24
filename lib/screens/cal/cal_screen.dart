import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/list_model.dart';
import '../../widgets/cal/cal_list.dart';

// ignore: use_key_in_widget_constructors 
class CalculateScreen extends StatefulWidget {
  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    ListModel objects = Provider.of<ListModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40.0,
                    child: Icon(
                      Icons.calculate,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'คำนวณ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade400,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'เพื่อนร่วมโต๊ะทั้งหมด ${5} คน',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'รายการอาหารทั้งหมด ${objects.menuItems.length} รายการ',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'ระบบจะคำนวณค่าอาหารที่แต่ละท่านต้องจ่ายอย่างเหมาะสม',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  child: FriendsList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

