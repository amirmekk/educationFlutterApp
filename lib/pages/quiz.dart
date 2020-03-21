import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  final List quizData;
  Quiz({Key key, this.quizData}) : super(key: key);
  @override
  _QuizState createState() => _QuizState();
}

int questionNumber = 0;
int score = 0;

class _QuizState extends State<Quiz> {
  @override
  void initState() {
    super.initState();
    questionNumber = 0;
    score = 0;
  }

  bool onHighLight = false;
  List trueOrFalseColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Directionality(
        child: Scaffold(
          backgroundColor: Colors.amber[800],
          body: Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'السؤال ${questionNumber + 1} من ${widget.quizData[0].length} ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Amiri',
                        ),
                      ),
                      Text(
                        'لقد اجبت $score اجابات صحيحة ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontFamily: 'Amiri',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: Text(
                      'ما هي الاجابة الصحيحة الموافقة للعنصر التالي :',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      '${widget.quizData[0][questionNumber].question}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize:
                            widget.quizData[0][questionNumber].question.length >
                                    30
                                ? 20
                                : 40,
                        fontFamily: 'Amiri',
                      ),
                    ),
                  ),
                  FlatButton.icon(
                    label: Text(
                      'التالي',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        updtaeQuestion();
                      });
                    },
                  ),
                  SizedBox(
                    height: 800,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) => Card(
                        color: trueOrFalseColors[index],
                        child: ListTile(
                          enabled: !onHighLight,
                          subtitle: Text(
                            '${widget.quizData[0][questionNumber].answers[index]}',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: widget.quizData[0][questionNumber]
                                          .answers[index].length >
                                      40
                                  ? 15
                                  : 25,
                              color: Colors.black,
                            ),
                          ),
                          leading: Text(
                            '1',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              for (int i = 0;
                                  i <
                                      widget.quizData[0][questionNumber].answers
                                          .length;
                                  i++) {
                                if (widget.quizData[0][questionNumber]
                                            .answers[i] ==
                                        widget.quizData[0][questionNumber]
                                            .correctAnswer &&
                                    onHighLight == false) {
                                  trueOrFalseColors[i] = Colors.green;
                                } else {
                                  trueOrFalseColors[i] = Colors.red;
                                }
                              }
                              if (widget.quizData[0][questionNumber]
                                          .answers[index] ==
                                      widget.quizData[0][questionNumber]
                                          .correctAnswer &&
                                  onHighLight == false) {
                                score++;
                              }
                              onHighLight = true;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
        textDirection: TextDirection.rtl,
      ),
      onWillPop: () async => false,
    );
  }

  void updtaeQuestion() {
    for (int i = 0; i < trueOrFalseColors.length; i++) {
      trueOrFalseColors[i] = Colors.white;
    }
    if (questionNumber == widget.quizData[0].length - 1) {
      print(score);
      Navigator.popAndPushNamed(context, '/resultAfterQuiz',
          arguments: [score, widget.quizData[0].length]);
    } else {
      questionNumber++;
      onHighLight = false;
    }
  }
}
