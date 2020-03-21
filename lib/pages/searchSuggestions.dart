import 'package:flutter/material.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:tarikh19/widgets/popUpAlert2.dart';

class SearchSuggestions extends StatefulWidget {
  final data ;
  SearchSuggestions({Key key ,this.data});
  @override
  _SearchSuggestionsState createState() => _SearchSuggestionsState();
}

class _SearchSuggestionsState extends State<SearchSuggestions> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: ListTile(
              isThreeLine: true,
              leading: Text(
                '${index + 1}',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) => PopUpAlert2(data: widget.data[index]) , );
                setState(() {
                  
                });
              },
              title: Text(widget.data[index].itemOne),
              subtitle: Text(widget.data[index].itemTwo),
              trailing: IconButton(
                icon: checkIfExist(widget.data[index].itemOne),
                onPressed: () {
                  setState(() {
                      updateBookmarks(widget.data[index].itemOne, widget.data[index].itemTwo);
                    });
                },
              ),
            ),
          ),
        );
      },
    );
  }
}