import 'dart:developer';

import 'package:quiz_app/quiz_model.dart';

class QuizBrain {
  int _index = 0;
  List<QuizModel> suroolorjanajooptor = <QuizModel>[
    QuizModel(suroolor: 'Кыргызстан Эгемендуу олко эмес', jooptor: false),
    QuizModel(
        suroolor: 'Кыргызстан эн чон мамлекет ',
        jooptor: false),
    QuizModel(
        suroolor: '  Ысык-Кол Кыргызстанда жайгашкан ', jooptor: true),
    QuizModel(suroolor: 'Кыргызстан Америка менен чектеш', jooptor: false),
    QuizModel(
        suroolor: '  Кыргызстандын элинин саны 15миллион ',
        jooptor: false),
    QuizModel(suroolor: 'Кыргызстан эн кооз олко', jooptor: true),
    QuizModel(suroolor: 'Кыргызстан Европада жайгашкан ', jooptor: false),
    QuizModel(suroolor: 'Кыргызстан тоолуу олко ', jooptor: true),
  ];

  String getQuestion() {
    if (_index < suroolorjanajooptor.length) {
      return suroolorjanajooptor[_index].suroolor;
    } else {
      return 'Конец';
    }
  }

  // joopty alyp kel
  bool getAnswers() {
    return suroolorjanajooptor[_index].jooptor;
  }

  //  suroonu otkoz
  void getNext() {
    log('_index:$_index');
    _index++;
  }

  //  noldon bashta
  void reset() {
    _index = 0;
  }
}

final QuizBrain quizBrain = QuizBrain();
