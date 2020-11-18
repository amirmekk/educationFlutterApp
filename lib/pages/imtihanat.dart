import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:tarikh19/data/imtihanatData.dart';
import 'package:tarikh19/pages/imtihanePage.dart';
import 'package:tarikh19/tools/showAd.dart';

class Imitihanat extends StatefulWidget {
  @override
  _ImitihanatState createState() => _ImitihanatState();
}

class _ImitihanatState extends State<Imitihanat> {
  List<Card> getYearsList(List sho3baData,
      {List<int> solutionsPageNumber,
      String pdfFile = 'imtihanatSolutions.pdf-s'}) {
    List<Card> yearsList = [];
    getSolution(int i) {
      showAdOrNot();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text('الحل النموذجي'),
            ),
            body: PDF(
              defaultPage: solutionsPageNumber[i] - 1,
              enableSwipe: true,
              //nightMode: true,
              autoSpacing: false,
              pageSnap: false,
              pageFling: false,
              onError: (error) {
                print(error.toString());
              },
              onPageError: (page, error) {
                print('$page: ${error.toString()}');
              },
              onPageChanged: (int page, int total) {
                print('page change: $page/$total');
              },
            ).fromAsset('assets/$pdfFile'),
          ),
        );
      }));
    }

    for (var i = 0; i < 12; i++) {
      yearsList.add(Card(
        child: ListTile(
          onTap: () {
            showAdOrNot();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => Imtihane(
                  data: ['باك ${2019 - i}', sho3baData[i]],
                ),
              ),
            );
          },
          title: Text('${2019 - i}'),
          trailing: FlatButton(
              onPressed: () {
                getSolution(i);
              },
              child: Text('الحل',
                  style: TextStyle(color: Theme.of(context).primaryColor))),
        ),
      ));
    }
    return yearsList;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('بكالوريات سابقة'),
        ),
        body: ListView(children: [
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'شعب علوم تجريبية + رياضيات + تقني رياضي',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      color: Colors.amber[800],
                      fontSize: 20,
                    ),
                  ),
                  children: getYearsList([
                    se2019,
                    se2018,
                    se2017,
                    se2016,
                    se2015,
                    se2014,
                    se2013,
                    se2012,
                    se2011,
                    se2010,
                    se2009,
                    se2008
                  ], solutionsPageNumber: [
                    45,
                    43,
                    41,
                    36,
                    32,
                    28,
                    23,
                    19,
                    15,
                    11,
                    5,
                    1
                  ], pdfFile: 'imtihanatSolutions-s.pdf'),
                ),
                SizedBox(height: 20),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'شعبة آداب وفلسفة',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      color: Colors.amber[800],
                      fontSize: 20,
                    ),
                  ),
                  children: getYearsList(
                    [
                      lp2019,
                      lp2018,
                      lp2017,
                      lp2016,
                      lp2015,
                      lp2014,
                      lp2013,
                      lp2012,
                      lp2011,
                      lp2010,
                      lp2009,
                      lp2008
                    ],
                    pdfFile: 'imtihanatSolutions-lp.pdf',
                    solutionsPageNumber: [
                      58,
                      54,
                      49,
                      44,
                      40,
                      34,
                      28,
                      24,
                      18,
                      13,
                      7,
                      1
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'شعبة لغات أجنبية',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      color: Colors.amber[800],
                      fontSize: 20,
                    ),
                  ),
                  children: getYearsList([
                    le2019,
                    le2018,
                    le2017,
                    le2016,
                    le2015,
                    le2014,
                    le2013,
                    le2012,
                    le2011,
                    le2010,
                    le2009,
                    le2008
                  ], solutionsPageNumber: [
                    35,
                    33,
                    31,
                    26,
                    22,
                    20,
                    17,
                    14,
                    11,
                    8,
                    5,
                    1
                  ], pdfFile: 'imtihanatSolutions-lang.pdf'),
                ),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'شعبة تسيير واقتصاد',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      color: Colors.amber[800],
                      fontSize: 20,
                    ),
                  ),
                  children: getYearsList(
                      [
                        ge2019,
                        ge2018,
                        ge2017,
                        ge2016,
                        ge2015,
                        ge2014,
                        ge2013,
                        ge2012,
                        ge2011,
                        ge2010,
                        ge2009,
                        ge2008
                      ],
                      pdfFile: 'imtihanatSolutions-ge.pdf',
                      solutionsPageNumber: [
                        45,
                        42,
                        38,
                        34,
                        29,
                        27,
                        23,
                        18,
                        14,
                        9,
                        5,
                        1
                      ]),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
