import 'package:flutter/material.dart';
import 'package:tarikh19/pages/bookmarks.dart';

class PopUpAlert extends StatelessWidget {
  final List data;
  final int index;
  PopUpAlert({this.data, this.index});
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: AlertDialog(
        title: Text('${data[1][index].itemOne}'),
        content: Text('${data[1][index].itemTwo}'),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                GestureDetector(
                  child: updateBookmarks(
                      data[1][index].itemOne, data[1][index].itemTwo),
                  onTap: () {
                    Navigator.pop(context, 'OK');

                    updateBookmarks(
                        data[1][index].itemOne, data[1][index].itemTwo);
                  },
                ),
              ],
            ),
          ),
          GestureDetector(
            child: Icon(
              Icons.check_circle,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context, 'OK');
            },
          ),
        ],
      ),
    );
  }
}
