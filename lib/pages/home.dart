import 'dart:math';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:flutter/material.dart';
import 'package:tarikh19/data/allData.dart';
import 'package:tarikh19/data/chakhsiyatData.dart';
import 'package:tarikh19/data/mostala7atData.dart';
import 'package:tarikh19/data/tawarikh.dart';
import 'package:tarikh19/pages/all.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:launch_review/launch_review.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RateMyApp ratingConditions = RateMyApp(
    preferencesPrefix: 'ratingConditions_',
    minDays: 3,
    minLaunches: 3,
    remindDays: 15,
    remindLaunches: 30,
  );
  int _selectedIndex = 0;
  List<Widget> _pages = [
    HomePage(),
    All(
      allList: ['العناصر', allData],
    ),
    Bookmarks(),
  ];
  _onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    ratingConditions.init().then((_) {
      if (ratingConditions.shouldOpenDialog) {
        ratingConditions.showStarRateDialog(
          context,
          title: 'هل أعجبك تطبيق تاريخ19؟',
          message: 'قم بتقييم التطبيق من أجل دعمنا لإضافة كل جديد',
          dialogStyle: DialogStyle(
            titleAlign: TextAlign.center,
            messageAlign: TextAlign.center,
            messagePadding: EdgeInsets.only(
              bottom: 20,
            ),
          ),
          starRatingOptions: StarRatingOptions(),
          actionsBuilder: (_, stars) {
            return [
              FlatButton(
                child: Text('OK'),
                onPressed: () async {
                  if (stars != null) {
                    if (stars <= 3) {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: AlertDialog(
                                actions: <Widget>[
                                  FlatButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.cancel,
                                        color: Colors.white,
                                      ),
                                      label: Text(
                                        'إغلاق النافذة',
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                                backgroundColor: Colors.amber[800],
                                content: Text(
                                  'شكرا على تقييمك ، نحن نعمل على تحسيين التطبيق ',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          });
                    }

                    if (stars > 3) {
                      Navigator.pop(context);
                      LaunchReview.launch(
                          androidAppId: "com.fc.play.nes.arcade2");
                    }
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
              FlatButton(
                  onPressed: () {
                    ratingConditions.reset();
                    Navigator.pop(context);
                  },
                  child: Text('لاحقا'))
            ];
          },
        );
      }
    });
  }

  Future<void> selectNotification(String payload) {
    setState(() {
      itemNumber++;
    });
    return null;
  }

  int itemNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('الرئيسية'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('بحث'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_half),
              title: Text('المفضلة'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTaped,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> anasirMokhtalifa = ['التواريخ', 'الشخصيات', 'المصطلحات'];
  List<Widget> anasirMokhtalifaIcons = [
    Icon(Icons.date_range, color: Colors.amber[800]),
    Icon(Icons.person, color: Colors.amber[800]),
    Icon(Icons.library_books, color: Colors.amber[800]),
  ];
  List<String> wa7adat = ['الوحدة الاولئ', 'الوحدة الثانية', 'الوحدة الثالثة'];
  List<String> myRoutes = ['/tawaraikh', '/chakhsiyat', '/mostala7at'];
  var randomItem = allData[new Random().nextInt(allData.length)];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.amber[800],
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 10, 30),
                  child: Row(
                    children: <Widget>[
                      Text(
                        'مرحبا بكم ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          fontFamily: 'Amiri',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'في تطبيق تاريخ19',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Amiri',
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 900,
                  padding: EdgeInsets.fromLTRB(0, 20, 10, 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: Text(
                          'عناصر مختلفة',
                          style: TextStyle(
                              color: Colors.amber[800],
                              fontSize: 20,
                              fontFamily: 'Amiri'),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 3,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, myRoutes[index]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                children: <Widget>[
                                  Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.amber[200],
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Positioned(
                                    top: 10,
                                    left: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: anasirMokhtalifaIcons[index],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    child: Text('${anasirMokhtalifa[index]}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    left: 10,
                                    bottom: 10,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: Text(
                          'عنصر عشوائي',
                          style: TextStyle(
                              color: Colors.amber[800],
                              fontSize: 20,
                              fontFamily: 'Amiri'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.assistant),
                          title: Text('${randomItem.itemOne}'),
                          subtitle: Text('${randomItem.itemTwo}'),
                          trailing: IconButton(
                            icon: Icon(Icons.cached),
                            onPressed: () {
                              setState(() {
                                randomItem = allData[
                                    new Random().nextInt(allData.length)];
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 20, 10),
                        child: Text(
                          'تصفح حسب الوحدات',
                          style: TextStyle(
                              color: Colors.amber[800],
                              fontSize: 20,
                              fontFamily: 'Amiri'),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) => Card(
                            color: Colors.amber[200],
                            child: ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/courseAndQuiz2',
                                    arguments: [
                                      index + 1, //reprensents wi7da number
                                      tawarikh,
                                      chakhsiyat,
                                      mostala7at,
                                    ],
                                  );
                                },
                                leading: Text(
                                  '${index + 1}',
                                  style: TextStyle(
                                    color: Colors.amber[800],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                title: Text(
                                  '${wa7adat[index]}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios,
                                    color: Colors.amber[800])),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
