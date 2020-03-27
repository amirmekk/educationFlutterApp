//import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_admob/firebase_admob.dart';

var getNumVar = 0;
showAdOrNot() async {
  getNum() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int clickNum = prefs.getInt('clickNum') ?? 0;

    getNumVar = clickNum;
  }

  addNum(num) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (num == 4) {
      await prefs.setInt('clickNum', 0);
      showAd();
      print(num);
    } else {
      await prefs.setInt('clickNum', num + 1);
      print(num);
    }
  }

  getNum();
  addNum(getNumVar);
}

showAd() {
  FirebaseAdMob.instance
      .initialize(appId: 'ca-app-pub-8633425750961898~7555431241');
  MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    keywords: <String>[
      'bac',
      'dz',
      'بكالوريا',
      'باك',
      'دراسة',
      'ثانوية',
      'ثالثة ثانوي',
      '3AS',
      'ency',
      'education'
    ],
    testDevices: <String>['719099099570B67D23BE4CCA12748B8B'],
  );
  InterstitialAd myInterstitial = InterstitialAd(
    adUnitId: 'ca-app-pub-8633425750961898/2631898317',
    targetingInfo: targetingInfo,
    listener: (MobileAdEvent event) {
      print("InterstitialAd event is $event");
    },
  );
  myInterstitial
    ..load()
    ..show(
      anchorType: AnchorType.bottom,
      anchorOffset: 0.0,
      horizontalCenterOffset: 0.0,
    );
}
