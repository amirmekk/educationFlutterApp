import 'package:flutter/material.dart';
import 'package:tarikh19/data/DorossData.dart';
import 'package:tarikh19/tools/showAd.dart';

//how the data that has been passed should've been structered
//data = ['title' , wi7daNumber , wad3iyaNomber]

class DorossPage extends StatefulWidget {
  final List data;
  DorossPage({this.data});
  @override
  _DorossPageState createState() => _DorossPageState();
}

class _DorossPageState extends State<DorossPage> {
  final List daressBody = [
    [wad3iya1, wad3iya2, wad3iya3, wad3iya4],
    [wad3iya5, wad3iya6, wad3iya7, wad3iya8],
    [wad3iya9, wad3iya10, wad3iya11],
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.data[0],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            showAdOrNot();
          },
          child: ListView(
            children: <Widget>[
              daressBody[widget.data[1] - 1][widget.data[2] - 1]
            ],
          ),
        ),
      ),
    );
  }
}
