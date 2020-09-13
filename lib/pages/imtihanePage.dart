import 'package:flutter/material.dart';

class Imtihane extends StatefulWidget {
  // data is organized like this : an array that has the title in first place then the actual data for the test
  final List data;
  Imtihane({this.data});
  @override
  _ImtihaneState createState() => _ImtihaneState();
}

class _ImtihaneState extends State<Imtihane> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.data[0]),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(5, 20, 10, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.data[1],
            ),
          ),
        ]),
      ),
    );
  }
}
