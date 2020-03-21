import 'package:flutter/material.dart';

List bookmarkedItems = [];

updateBookmarks(itemOne, itemTwo) {
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
      }
    }
    print(bookmarkedItems);
    return Icon(Icons.star_border);
  }
  if (!isThere) {
    toBeAdded.addAll([itemOne, itemTwo]);
    bookmarkedItems.add(toBeAdded);
    print(bookmarkedItems);
    return Icon(Icons.star);
  }
}

checkIfExist(itemOne) {
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
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text('المفضلة')),
        body: Container(
            child: bookmarkedItems.isEmpty
                ? Center(child: Text('قم باضافة عناصر الى المفضلة لتتمكن من رؤيتهم هنا'))
                : ListView.builder(
                    itemBuilder: (context, index) => Card(
                      child: ListTile(
                        title: Text(bookmarkedItems[index][0]),
                        subtitle: Text(bookmarkedItems[index][1]),
                        trailing: IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
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
