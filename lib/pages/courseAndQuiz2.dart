import 'package:flutter/material.dart';
import 'package:tarikh19/data/allData.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:tarikh19/data/quizData.dart';
import 'package:tarikh19/tools/showAd.dart';

class CourseAndQuiz2 extends StatefulWidget {
  final List courseAndQuiz;
  CourseAndQuiz2({Key key, this.courseAndQuiz}) : super(key: key);

  @override
  _CourseAndQuiz2State createState() => _CourseAndQuiz2State();
}

class _CourseAndQuiz2State extends State<CourseAndQuiz2> {
  List filteredTawarikhData = [];
  List filteredChakhsiyatData = [];
  List filteredMostala7atData = [];
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.courseAndQuiz[1].length; i++) {
      if (widget.courseAndQuiz[0] == widget.courseAndQuiz[1][i].wihda) {
        filteredTawarikhData.add(widget.courseAndQuiz[1][i]);
      }
    }
    for (int i = 0; i < widget.courseAndQuiz[2].length; i++) {
      if (widget.courseAndQuiz[0] == widget.courseAndQuiz[2][i].wihda) {
        filteredChakhsiyatData.add(widget.courseAndQuiz[2][i]);
      }
    }
    for (int i = 0; i < widget.courseAndQuiz[3].length; i++) {
      if (widget.courseAndQuiz[0] == widget.courseAndQuiz[3][i].wihda) {
        filteredMostala7atData.add(widget.courseAndQuiz[3][i]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> _wa7adat = [
      'nothing to see here',
      'الوحدة الاولى',
      'الوحدة الثانية',
      'الوحدة الثالثة',
    ];
    List _quizzes = [
      [quiz1, quiz2, quiz3, quiz4],
      [quiz5, quiz6, quiz7, quiz8],
      [quiz9, quiz10, quiz11, quiz11],
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showAdOrNot();
                    Navigator.pushNamed(context, '/all',
                        arguments: ['العناصر', allData]);
                  })
            ],
            title: Text('${_wa7adat[widget.courseAndQuiz[0]]}'),
            bottom: TabBar(
              indicatorColor: Colors.amber[400],
              isScrollable: true,
              tabs: [
                Tab(text: 'تواريخ'),
                Tab(text: 'شخصيات'),
                Tab(text: 'مصطلحات'),
                Tab(text: 'امتحان قصير'),
                Tab(text: 'الدروس'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemCount: filteredTawarikhData.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    trailing: IconButton(
                      icon: checkIfExist(
                        filteredTawarikhData[index].itemOne,
                      ),
                      onPressed: () {
                        showAdOrNot();
                        setState(() {
                          updateBookmarks(filteredTawarikhData[index].itemOne,
                              filteredTawarikhData[index].itemTwo);
                        });
                      },
                    ),
                    title: Text('${filteredTawarikhData[index].itemOne}'),
                    subtitle: Text('${filteredTawarikhData[index].itemTwo}'),
                    leading: filteredTawarikhData[index].wad3iya != null
                        ? Text(
                            'الوضعية ${filteredTawarikhData[index].wad3iya}',
                            style: TextStyle(
                                color: Colors.amber[800],
                                fontSize: 14,
                                fontFamily: 'Amiri'),
                          )
                        : Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: Colors.amber[800],
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: filteredChakhsiyatData.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    trailing: IconButton(
                      icon: checkIfExist(
                        filteredChakhsiyatData[index].itemOne,
                      ),
                      onPressed: () {
                        showAdOrNot();
                        setState(() {
                          updateBookmarks(filteredChakhsiyatData[index].itemOne,
                              filteredChakhsiyatData[index].itemTwo);
                        });
                      },
                    ),
                    title: Text('${filteredChakhsiyatData[index].itemOne}'),
                    subtitle: Text('${filteredChakhsiyatData[index].itemTwo}'),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: filteredMostala7atData.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    trailing: IconButton(
                      icon: checkIfExist(
                        filteredMostala7atData[index].itemOne,
                      ),
                      onPressed: () {
                        showAdOrNot();
                        setState(() {
                          updateBookmarks(filteredMostala7atData[index].itemOne,
                              filteredMostala7atData[index].itemTwo);
                        });
                      },
                    ),
                    title: Text('${filteredMostala7atData[index].itemOne}'),
                    subtitle: Text('${filteredMostala7atData[index].itemTwo}'),
                  ),
                ),
              ),
              ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(
                      'امتحان قصير  ${index + 1}',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      showAdOrNot();
                      Navigator.pushNamed(context, '/quiz', arguments: [
                        _quizzes[widget.courseAndQuiz[0] - 1][index]
                      ]);
                    },
                  ),
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    onTap: () {
                      showAdOrNot();
                      Navigator.pushNamed(context, '/dorossPage', arguments: [
                        widget.courseAndQuiz[4][index][0],
                        widget.courseAndQuiz[0],
                        index + 1
                      ]);
                    },
                    title: Text(widget.courseAndQuiz[4][index][0]),
                    subtitle: Text((widget.courseAndQuiz[4][index].length == 1)
                        ? ''
                        : widget.courseAndQuiz[4][index][1]),
                  ),
                ),
                itemCount: (widget.courseAndQuiz[0] == 1 ||
                        widget.courseAndQuiz[0] == 2)
                    ? 4
                    : 3,
              )
            ],
          ),
        ),
      ),
    );
  }
}
