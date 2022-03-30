import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_brain.dart';

import 'custom_button.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Icon> icons = <Icon>[];
  Icon correctIcon = const Icon(
    Icons.check,
    color: Colors.green,
    size: 40.0,
  );
  Icon incorrectIcon = const Icon(
    Icons.close,
    color: Colors.red,
    size: 40.0,
  );

  String suroo;

  // buttu teksherip atabyz
  bool isFinished;
  // koldonuuchu joop berdy
  void userAnswered(bool userAnswer) {
    //  bool correctAnswer =QuizBrain().getAnswers();
    bool correctAnswer = quizBrain.getAnswers();
    log('userAnswer.answer:${userAnswer == correctAnswer}');
    if (userAnswer == correctAnswer) {
      icons.add(correctIcon);
    } else {
      icons.add(incorrectIcon);
    }
    quizBrain.getNext();
    suroo = quizBrain.getQuestion();
    if (suroo == 'Конец') {
      isFinished = true;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    suroo = quizBrain.getQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'ТАПШЫРМА-07',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 25.0,
            ),
            Text(
              // QuizBrain().getAnswers();
              // quizBrain.getQuestion(),
              suroo ?? ' Suroolor',
              // suroo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26.0,
              ),
            ),
            if (isFinished == true)
              CustomButton(
                textButton: ' Пройти занова ',
                onPress: () {
                  quizBrain.reset();
        
                  suroo = quizBrain.getQuestion();
                  isFinished = false;
                  icons=<Icon>[];
                  setState(() {});
                },
              )
            else
              Column(
                children: [
                  CustomButton(
                    onPress: () {
                      userAnswered(true);
                      // QuizBrain().getAnswers();
                      // icons.add(correctIcon);
                      //   setState(() {
                    
                      //   });
                    },
                    textButton: 'Туура',
                    color: const Color(0xff4CAF52),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    onPress: () {
                      userAnswered(false);
                      // QuizBrain().getAnswers();
                      // icons.add(incorrectIcon);
                      // setState(() {
                    
                      // });
                    },
                    textButton: 'Туура эмес',
                    color: const Color(0xffF54335),
                  ),
                ],
              ),
            Row(
              children: icons,
            )
          ],
        ),
      ),
    );
  }
}
