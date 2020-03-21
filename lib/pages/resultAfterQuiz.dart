import 'package:flutter/material.dart';

class ResultAfterQuiz extends StatelessWidget {
  final data;
  ResultAfterQuiz({this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[800],
      body: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'نتيجتك النهائية هي  ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Amiri',
                ),
              ),
            ),
            Center(
              child: Text(
                '${data[0]}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 100,
                  fontFamily: 'Amiri',
                ),
              ),
            ),
            Center(
              child: Text(
                'من ${data[1]} اجابات صحيحة',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Amiri',
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
