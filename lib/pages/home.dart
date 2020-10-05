import 'package:rate_my_app/rate_my_app.dart';
import 'package:flutter/material.dart';
import 'package:tarikh19/data/allData.dart';
import 'package:tarikh19/pages/all.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:launch_review/launch_review.dart';
import 'package:tarikh19/pages/homePage.dart';
import 'package:tarikh19/tools/showAd.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController;
  int pageIndex = 0;
//needed to rate my app
  RateMyApp ratingConditions = RateMyApp(
    preferencesPrefix: 'ratingConditions_',
    minDays: 3,
    minLaunches: 3,
    remindDays: 15,
    remindLaunches: 30,
  );
//each one represents one of the main pages '3anasir' of the home page
//and _selected index change between them when the users clicks on any one using the _onItemTaped function
  List<Widget> _pages = [
    HomePage(),
    All(
      allList: ['العناصر', allData],
    ),
    Bookmarks(),
  ];

  onPageChanged(int pageIndex) {
    showAdOrNot();
    setState(() {
      this.pageIndex = pageIndex;
    });
  }

  onTap(int pageIndex) {
    pageController.animateToPage(
      pageIndex,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  Scaffold buildAuthScreen() {
    return Scaffold(
      body: PageView(
        children: _pages,
        controller: pageController,
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'الرئيسية',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'بحث',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_half),
            label: 'المفضلة',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: pageIndex,
        onTap: (index) {
          onTap(index);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    //if you want to update the item stored in the shared preference uncomment the following line
    //and add updatePrefrencesInBG to the imports
    //updateItem();
    //this is where i implemented the rate my app functionality
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
                          androidAppId: "com.tarikh19.tarikh19");
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

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: buildAuthScreen(),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
