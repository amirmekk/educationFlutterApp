import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tarikh19/data/mostala7atData.dart';
import 'package:tarikh19/tools/showAd.dart';
import 'package:tarikh19/widgets/popUpAlert2.dart';

class Mostala7at extends StatefulWidget {
  @override
  _Mostala7atState createState() => _Mostala7atState();
}

class _Mostala7atState extends State<Mostala7at> {
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
        appBar: AppBar(title: Text('المصطلحات')),
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
                    Navigator.pushNamed(context, '/courseAndQuiz',
                        arguments: [_wa7adat[index], 'مصطلحات', 4, 2]);
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
                    title: Text(' مصطلح عشوائي'),
                    onTap: () {
                      showAdOrNot();
                      var rng = new Random();
                      var randomItem =
                          mostala7at[rng.nextInt(mostala7at.length)];
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
                    title: Text('جميع المصطلحات'),
                    onTap: () {
                      showAdOrNot();
                      Navigator.pushNamed(context, '/all',
                          arguments: ['الشخصيات', mostala7at]);
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
