import 'package:flutter/material.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:tarikh19/widgets/popUpAlert2.dart';

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
                        builder: (_) =>
                            PopUpAlert2(data: widget.appBarTitleData[1][index]),
                      );
                      setState(() {});
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
