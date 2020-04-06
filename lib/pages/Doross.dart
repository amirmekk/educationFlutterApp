import 'package:flutter/material.dart';
import 'package:tarikh19/tools/showAd.dart';

class Doross extends StatefulWidget {
  final List data;
  Doross({this.data});
  @override
  _DorossState createState() => _DorossState();
}

class _DorossState extends State<Doross> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ملخصات التاريخ'),
        ),
        body: ListView(children: [
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'الوحدة الأولى : تطور العالم في ظل الثنائية القطبية 1945-1989',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                    ),
                  ),
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الاولى', 1, 1]);
                        },
                        title: Text(
                            'الوضعية الاولى : بروز الصراع وتشكل العالم-الثنائية القطبية- '),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الثانية', 1, 2]);
                        },
                        title: Text(
                            'الوضعية الثانية : الأزمات الدولية في ظل الصراع بين الشرق والغرب '),
                        subtitle:
                            Text('خاص بشعبتي آداب وفسلفة + تسيير واقتصاد'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الثالثة', 1, 3]);
                        },
                        title: Text(
                            'الوضعية الثالثة : مساعي الإنفراج الدولي - التعايش السلمي -  '),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الرابعة', 1, 4]);
                        },
                        title: Text(
                            'الوضعية الرابعة : من الثنائية الى الأحادية القطبية '),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'الوحدة الثانية : الجزائر مابين 1945-1989',
                    style: TextStyle(fontFamily: 'Amiri'),
                  ),
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الاولى', 2, 1]);
                        },
                        title: Text(
                            'الوضعية الاولى : من تبلور الوعي الوطني الى الثورة التحريرية '),
                        subtitle:
                            Text('خاص بشعبتي آداب وفسلفة + تسيير واقتصاد'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الثانية', 2, 2]);
                        },
                        title: Text(
                            'الوضعية الثانية : العمل المسلح ورد فعل الاستعمار '),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الثالثة', 2, 3]);
                        },
                        title: Text(
                            'الوضعية الثالثة : إستعادة السيادة الوطنية وبناء الدولة  '),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الرابعة', 2, 4]);
                        },
                        title: Text(
                            'الوضعية الرابعة : تأثير الجزائر وإسهامها في حركات التحرر '),
                        subtitle:
                            Text('خاص بشعبتي آداب وفسلفة + تسيير واقتصاد'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                ExpansionTile(
                  backgroundColor: Colors.white,
                  title: Text(
                    'الوحدة الثالثة : تطور العالم الثالث مابين 1945- 1989',
                    style: TextStyle(fontFamily: 'Amiri'),
                  ),
                  children: <Widget>[
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الاولى', 3, 1]);
                        },
                        title: Text(
                            'الوضعية الاولى : العالم الثالث بين تراجع الإستعمار التقليدي واستمرارية حركات التحرر '),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الثانية', 3, 2]);
                        },
                        title: Text(
                            'الوضعية الثانية : سقوط الإتحاد السوفييتي واأثره على العالم '),
                        subtitle:
                            Text('خاص بشعبتي آداب وفسلفة + تسيير واقتصاد'),
                      ),
                    ),
                    Card(
                      child: ListTile(
                        onTap: () {
                          showAdOrNot();
                          Navigator.pushNamed(context, '/dorossPage',
                              arguments: ['الوضعية الثالثة', 3, 3]);
                        },
                        title: Text(
                            'الوضعية الثالثة : فلسطين من تصفية الإستعمار التقليدي الى الهيمنة و الأحادية والتواطئ الدولي  '),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
