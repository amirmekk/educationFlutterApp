import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

List bookmarkedItems = [];

updateBookmarks(itemOne, itemTwo) async {
  final prefs = await SharedPreferences.getInstance();
  bookmarkedItems = prefs.getString('favoriteList') == null
      ? []
      : jsonDecode(prefs.getString('favoriteList'));
  List toBeAdded = [];
  bool isThere = false;

  for (int i = 0; i < bookmarkedItems.length; i++) {
    if (bookmarkedItems[i][0] == itemOne) {
      isThere = true;
    }
  }

  if (isThere) {
    for (int i = 0; i < bookmarkedItems.length; i++) {
      if (bookmarkedItems[i][0] == itemOne) {
        bookmarkedItems.removeAt(i);
        prefs.setString('favoriteList', jsonEncode(bookmarkedItems));
      }
    }
    print(bookmarkedItems);
    return Icon(Icons.star_border);
  } else if (!isThere) {
    toBeAdded.addAll([itemOne, itemTwo]);
    bookmarkedItems.add(toBeAdded);
    prefs.setString('favoriteList', jsonEncode(bookmarkedItems));
    print(bookmarkedItems);
    return Icon(Icons.star);
  }
}

checkIfExist(itemOne) {
  //sync bookmarked list with the persisted list !

  getData() async {
    final prefs = await SharedPreferences.getInstance();
    bookmarkedItems = prefs.getString('favoriteList') == null
        ? []
        : jsonDecode(prefs.getString('favoriteList'));
  }

  getData();

  bool isThere = false;
  for (int i = 0; i < bookmarkedItems.length; i++) {
    if (bookmarkedItems[i][0] == itemOne) {
      isThere = true;
    }
  }
  if (isThere) {
    print(bookmarkedItems);
    return Icon(Icons.star);
  }
  if (!isThere) {
    print(bookmarkedItems);
    return Icon(Icons.star_border);
  }
}

class Bookmarks extends StatefulWidget {
  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  List bookmarkedItems = [];
  @override
  void initState() {
    super.initState();
    getStoredData();
  }

  getStoredData() async {
    final prefs = await SharedPreferences.getInstance();
    final List data = prefs.getString('favoriteList') == null
        ? []
        : jsonDecode(prefs.getString('favoriteList'));
    setState(() {
      bookmarkedItems = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('المفضلة')),
        body: Container(
            child: bookmarkedItems.isEmpty
                ? Center(
                    child: Text(
                        'قم باضافة عناصر الى المفضلة لتتمكن من رؤيتهم هنا'))
                : ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(bookmarkedItems[index][0]),
                        subtitle: Text(bookmarkedItems[index][1]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
                              updateBookmarks(bookmarkedItems[index][0],
                                  bookmarkedItems[index][1]);
                              setState(() {
                                bookmarkedItems.removeAt(index);
                                print(bookmarkedItems);
                              });
                            }),
                      ),
                    ),
                    itemCount: bookmarkedItems.length,
                  )),
      ),
    );
  }
}
