import 'package:flutter/material.dart';
import 'friend_model.dart';
import 'menu_model.dart';

class ListModel extends ChangeNotifier {
  List<FriendModel> friendItems;
  List<MenuModel> menuItems;
  ListModel({required this.friendItems, required this.menuItems});

  void addFriend(FriendModel newItim) {
    friendItems.insert(0, newItim);
    notifyListeners();
  }
  void editFriend(FriendModel newItem) {
    var index = friendItems.indexWhere((element) => element.idName == newItem.idName);
    if (index != -1) {
      friendItems[index] = FriendModel(
        idName: newItem.idName,
        name: newItem.name,
        pay: newItem.pay,
      );
      notifyListeners();
    }
  }
  void deleteFriend(FriendModel editItem) {
    friendItems.map((e) => e.idName != editItem.idName).toList();
    notifyListeners();
  }
//////////////////////////////////////////////////////////////////////////
  void addMenu(MenuModel newItim) {
    menuItems.insert(0, newItim);
    notifyListeners();
  }
  void editMenu(MenuModel newItem) {
    var index = menuItems.indexWhere((element) => element.idMenu == newItem.idMenu);
    if (index != -1) {
      friendItems[index] = FriendModel(
        idName: newItem.idMenu,
        name: newItem.nameMenu,
        pay: newItem.price,
      );
      notifyListeners();
    }
  }
  void deleteMenu(MenuModel editItem) {
    menuItems.map((e) => e.idMenu != editItem.idMenu).toList();
    notifyListeners();
  }
}
