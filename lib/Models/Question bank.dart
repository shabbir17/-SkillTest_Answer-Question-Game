import 'question.dart';
class QuestionBank {
  int _questionIndex = 0;

  // ignore: prefer_final_fields
  List<Question> _questionList = [
    Question('Abdul Hamid is a president of Bangladesh', true),
    Question('Rajshahi is capital of bangladesh', false),
    Question('England won\'s the Icc  T20 worldcup in 2022', false),
    Question('Pakistan won\'s the Icc  T20 worldcup in 2022', false),
  ];

  String getQuestionText() {
    return _questionList[_questionIndex].getQuestion()!;
  }

  bool getQuestionAnswer() {
    return _questionList[_questionIndex].getAnswer()!;
  }

  void nextQuestionIndex() {
    if (_questionIndex < _questionList.length - 1) {
      _questionIndex = _questionIndex + 1;
    } else {
      _questionIndex = 0;
    }
  }
}
