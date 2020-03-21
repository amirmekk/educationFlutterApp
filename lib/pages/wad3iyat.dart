import 'package:flutter/material.dart';

class Wad3iyaPage extends StatelessWidget {
  final List appBarTitleData;
  Wad3iyaPage({this.appBarTitleData});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text(appBarTitleData[0]),
          ),
          body: ListView.builder(
              itemCount: appBarTitleData[1].length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: AlertDialog(
                                  title: Text('${appBarTitleData[1][index].itemOne}'),
                                  content: Text('${appBarTitleData[1][index].itemTwo}'),
                                  actions: <Widget>[
                                    Container(
                                      margin: EdgeInsets.all(10),
                                      child: Row(
                                        children: <Widget>[
                                          GestureDetector(
                                            child: Icon(
                                              Icons.star_border,
                                              size: 30,
                                            ),
                                            onTap: () {
                                              print('stared');
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
                              ));
                    },
                    trailing: IconButton(
                      icon: Icon(Icons.star_border),
                      onPressed: () {},
                    ),
                    subtitle: Text('${appBarTitleData[1][index].itemTwo}'),
                    isThreeLine: true,
                    leading: Text(
                      '${index + 1}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text('${appBarTitleData[1][index].itemOne}'),
                  ),
                );
              })),
    );
  }
}
