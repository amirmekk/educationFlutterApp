import 'package:flutter/material.dart';
import 'package:tarikh19/pages/bookmarks.dart';

class Wad3iyaPage extends StatefulWidget {
  final List appBarTitleData;
  Wad3iyaPage({this.appBarTitleData});

  @override
  _Wad3iyaPageState createState() => _Wad3iyaPageState();
}

class _Wad3iyaPageState extends State<Wad3iyaPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.appBarTitleData[0]),
          ),
          body: ListView.builder(
              itemCount: widget.appBarTitleData[1].length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  title: Text(
                                      '${widget.appBarTitleData[1][index].itemOne}'),
                                  content: Text(
                                      '${widget.appBarTitleData[1][index].itemTwo}'),
                                  actions: <Widget>[
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
                              ));
                    },
                    trailing: IconButton(
                      icon: checkIfExist(
                          widget.appBarTitleData[1][index].itemOne),
                      onPressed: () {
                        setState(() {
                          updateBookmarks(
                              widget.appBarTitleData[1][index].itemOne,
                              widget.appBarTitleData[1][index].itemTwo);
                        });
                      },
                    ),
                    subtitle:
                        Text('${widget.appBarTitleData[1][index].itemTwo}'),
                    isThreeLine: true,
                    leading: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text('${widget.appBarTitleData[1][index].itemOne}'),
                  ),
                );
              })),
    );
  }
}
