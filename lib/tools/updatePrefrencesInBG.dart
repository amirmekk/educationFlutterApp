import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarikh19/data/allData.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';

updateItem() async {
  await AndroidAlarmManager.initialize();
  await AndroidAlarmManager.periodic(const Duration(hours: 20), 0, updater);
}

updater() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setInt('randomItemNum', new Random().nextInt(allData.length));
  var randomItem = allData[prefs.getInt('randomItemNum')];
  final DateTime now = DateTime.now();
  print("[$now] ${randomItem.itemOne}");
}
