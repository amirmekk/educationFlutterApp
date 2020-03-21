import 'package:flutter/material.dart';
import 'package:tarikh19/pages/bookmarks.dart';

class PopUpAlert2 extends StatefulWidget {
  final data;
  PopUpAlert2({this.data});

  @override
  _PopUpAlert2State createState() => _PopUpAlert2State();
}

class _PopUpAlert2State extends State<PopUpAlert2> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        backgroundColor: Colors.amber[800],
        shape:RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20) ,
        )  ,
        title: Center(
          child: Text(
            '${widget.data.itemOne}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25 , 
              fontFamily: 'Amiri'
            ),
          ),
        ),
        content: Text('${widget.data.itemTwo}'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: checkIfExist(widget.data.itemOne),
                  onPressed: () {
                    setState(() {
                      updateBookmarks(widget.data.itemOne, widget.data.itemTwo);
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.check_circle_outline,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
