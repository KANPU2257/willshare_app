import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_app/models/friend/friends_list_model.dart';
import '../../models/friend/friends_list_model.dart';
import 'add_friends_screen.dart';
import '../../widgets/friend/friends_list.dart';

// ignore: use_key_in_widget_constructors 
class FriendsScreen extends StatefulWidget {
  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    FriendsListModel friendsObject = Provider.of<FriendsListModel>(context);
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
                      Icons.person_add,
                      size: 40.0,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.pink,
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'รายชื่อเพื่อนร่วมโต๊ะ',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.grey.shade400,
                      fontSize: 40,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    'เพื่อนร่วมโต๊ะทั้งหมด ${friendsObject.friends.length} คน',
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20,
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
                    // left: 40,
                    // right: 40,
                    top: 20,
                    bottom: 10,
                  ),
                  child: FriendsList(),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.pinkAccent,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddFriendsScreen(),
          );
        },
      ),
    );
  }
}
