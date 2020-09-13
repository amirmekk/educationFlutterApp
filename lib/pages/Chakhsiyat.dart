import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tarikh19/data/chakhsiyatData.dart';
import 'package:tarikh19/tools/showAd.dart';
import 'package:tarikh19/widgets/popUpAlert2.dart';

class Chakhsiyat extends StatefulWidget {
  @override
  _ChakhsiyatState createState() => _ChakhsiyatState();
}

class _ChakhsiyatState extends State<Chakhsiyat> {
  List<String> _wa7adat = [
    'الوحدة الاولى',
    'الوحدة الثانية',
    'الوحدة الثالثة',
  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('الشخصيات')),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    showAdOrNot();
                    List newChakhsiyat = chakhsiyat
                        .where((i) => i.wihda == (index + 1))
                        .toList();
                    Navigator.pushNamed(context, '/wad3iyaPage', arguments: [
                      'شخصيات ${_wa7adat[index]}',
                      newChakhsiyat
                    ]);
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.amber[200],
                    ),
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                        child: Text(
                          _wa7adat[index],
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              fontFamily: 'Amiri'),
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'عناصر متفرقة',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber[800]),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.library_books),
                    title: Text(' شخصية عشوائية'),
                    onTap: () {
                      showAdOrNot();
                      var rng = new Random();
                      var randomItem =
                          chakhsiyat[rng.nextInt(chakhsiyat.length)];
                      showDialog(
                        context: context,
                        builder: (_) => PopUpAlert2(data: randomItem),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.format_align_left),
                    title: Text('جميع الشخصيات'),
                    onTap: () {
                      showAdOrNot();
                      Navigator.pushNamed(context, '/all',
                          arguments: ['الشخصيات', chakhsiyat]);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
