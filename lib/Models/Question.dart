class Question {
  String? _text;
  bool? _answer;

  Question(this._text, this._answer);

  void setQuestion(String value) {
    _text = value;
  }

  String? getQuestion() {
    return _text;
  }

  void setAnswer(bool value) {
    _answer = value;
  }

  bool? getAnswer() {
    return _answer;
  }

//bool? getAnswer() =>_answer;
}
