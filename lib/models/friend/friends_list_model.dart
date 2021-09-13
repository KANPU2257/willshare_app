import 'package:flutter/material.dart';
import 'friend_model.dart';

class FriendsListModel extends ChangeNotifier {
  List<FriendModel> friends;
  FriendsListModel({required this.friends});
  void addFriends(FriendModel newFriend) {
    friends.insert(0, newFriend);
    notifyListeners();
  }

  void editFriend(FriendModel newFriend) {
    var index = friends.indexWhere((element) => element.id == newFriend.id);
    if (index != -1) {
      friends[index] = FriendModel(
        id: newFriend.id,
        name: newFriend.name,
        pay: newFriend.pay,
      );
      notifyListeners();
    }
  }

  void deleteFriends(FriendModel editFriend) {
    friends.map((e) => e.id != editFriend.id).toList();
    notifyListeners();
  }
}
