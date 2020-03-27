import 'package:flutter/material.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:tarikh19/tools/search.dart';
import 'package:tarikh19/tools/showAd.dart';

class All extends StatefulWidget {
  final List allList;
  All({Key key, this.allList}) : super(key: key);
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('جميع ${widget.allList[0]}'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(
                      context: context,
                      delegate: DataSearch(data: widget.allList[1]));
                },
                icon: Icon(Icons.search))
          ],
        ),
        body: Container(
            child: ListView.builder(
          itemCount: widget.allList[1].length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () {
                showAdOrNot();
              },
              trailing: IconButton(
                icon: checkIfExist(widget.allList[1][index].itemOne),
                onPressed: () {
                  showAdOrNot();
                  setState(() {
                    updateBookmarks(widget.allList[1][index].itemOne,
                        widget.allList[1][index].itemTwo);
                  });
                },
              ),
              subtitle: Text('${widget.allList[1][index].itemTwo}'),
              isThreeLine: true,
              leading: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              title: Text('${widget.allList[1][index].itemOne}'),
            ),
          ),
        )),
      ),
    );
  }
}
