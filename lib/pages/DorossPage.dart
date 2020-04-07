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
          onLongPress: () {
            showAdOrNot();
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('media/texture.jpg') , fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.purple,
                width: 3,
              ),
            ),
            padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                daressBody[widget.data[1] - 1][widget.data[2] - 1]
              ],
            ),
          ),
        ),
      ),
    );
  }
}
