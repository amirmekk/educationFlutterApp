import 'package:flutter/material.dart';
import 'package:tarikh19/pages/searchSuggestions.dart';


class DataSearchAll extends SearchDelegate {
  List data;
  DataSearchAll({this.data});
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_forward),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        query = '';
      },
      icon: Icon(Icons.clear),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List newData = data
        .where((f) => f.itemTwo.contains(query) || f.itemOne.contains(query))
        .toList();
    return SearchSuggestions(data: newData,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List newData = data
        .where((f) => f.itemTwo.contains(query) || f.itemOne.contains(query))
        .toList();
    return SearchSuggestions(data: newData,);
  }
}
