import 'package:flutter/material.dart';

class FavouritProvider with ChangeNotifier{
  List<int> _itemList = [];

  List<int> get itemList => _itemList;

  void addToFavourit(int index){
   _itemList.add(index);
   notifyListeners();
  }

  void removeFromFavourit(int index){
    _itemList.remove(index);
    notifyListeners();
  }
}