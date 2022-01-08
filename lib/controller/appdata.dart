import 'dart:convert';

import 'package:daily_expense/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';




class AppData {
 static List<Item> _itemList = [];
 static late SharedPreferences _sharedPreferences;
 static late List<String> _jsonItemList = [];

 static Future<void> initItem() async {
  _sharedPreferences = await SharedPreferences.getInstance();

  final _tempJsonItemList = _sharedPreferences.getStringList('itemList');

  if(_tempJsonItemList != null){
   _jsonItemList = _tempJsonItemList;
   _itemList = _tempJsonItemList.map((json) => Item.fromJson(jsonDecode(json))).toList();
  }
 }

 static Future<void> addItem(item) async {
  _itemList.add(item);
  _jsonItemList.add(jsonEncode(item));

  await _sharedPreferences.setStringList('itemList', _jsonItemList);
 }

 static List<Item> getItems() {
  return _itemList;
 }

 static Future<void> saveItems() async {
  _jsonItemList = _itemList.map((item) => jsonEncode(item)).toList();
  await _sharedPreferences.setStringList('itemList', _jsonItemList);
 }
 static Future<void> removeItems(int index) async {
  _itemList.removeAt(index);
  _jsonItemList.removeAt(index);
  await _sharedPreferences.setStringList('itemList', _jsonItemList);
 }
}