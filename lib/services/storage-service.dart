import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageService{

    Future<void> saveData(List list) async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString('list_expenses', jsonEncode(list));
    }

    Future<void> getData() async {
        SharedPreferences pref = await SharedPreferences.getInstance();
        return jsonDecode(pref.getString('list_expenses'));

    }
}