import 'package:flutter/material.dart';
import 'package:tarikh19/pages/Chakhsiyat.dart';
import 'package:tarikh19/pages/Mostala7at.dart';
import 'package:tarikh19/pages/Tawarikh.dart';
import 'package:tarikh19/pages/all.dart';
import 'package:tarikh19/pages/bookmarks.dart';
import 'package:tarikh19/pages/courseAndQuiz.dart';
import 'package:tarikh19/pages/courseAndQuiz2.dart';
import 'package:tarikh19/pages/home.dart';
import 'package:tarikh19/pages/Doross.dart';
import 'package:tarikh19/pages/DorossPage.dart';
import 'package:tarikh19/pages/quiz.dart';
import 'package:tarikh19/pages/resultAfterQuiz.dart';
import 'package:tarikh19/pages/splashScreen.dart';
import 'package:tarikh19/pages/wad3iyat.dart';

class RouteGenerator {
  static Route<dynamic> routeGenerator(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/courseAndQuiz':
        return MaterialPageRoute(
          builder: (_) => CourseAndQuiz(
            courseAndQuiz: args,
          ),
        );
      case '/courseAndQuiz2':
        return MaterialPageRoute(
          builder: (_) => CourseAndQuiz2(
            courseAndQuiz: args,
          ),
        );
      case '/dorossPage':
        return MaterialPageRoute(
          builder: (_) => DorossPage(
            data: args,
          ),
        );
      case '/doross':
        return MaterialPageRoute(
          builder: (_) => Doross(
            data: args,
          ),
        );
      case '/chakhsiyat':
        return MaterialPageRoute(
          builder: (_) => Chakhsiyat(),
        );
      case '/mostala7at':
        return MaterialPageRoute(
          builder: (_) => Mostala7at(),
        );
      case '/tawaraikh':
        return MaterialPageRoute(
          builder: (_) => Tawarikh(),
        );
      case '/resultAfterQuiz':
        return MaterialPageRoute(
          builder: (_) => ResultAfterQuiz(
            data: args,
          ),
        );
      case '/all':
        return MaterialPageRoute(
          builder: (_) => All(
            allList: args,
          ),
        );
      case '/bookmarks':
        return MaterialPageRoute(
          builder: (_) => Bookmarks(
              //allList: args,
              ),
        );
      case '/wad3iyaPage':
        return MaterialPageRoute(
          builder: (_) => Wad3iyaPage(
            appBarTitleData: args,
          ),
        );
      case '/quiz':
        return MaterialPageRoute(
          builder: (_) => Quiz(
            quizData: args,
          ),
        );

      default:
        return _errorRoute();
    }
  }
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return Scaffold(
      appBar: AppBar(title: Text('error')),
    );
  });
}
