import 'package:flutter/material.dart';
import 'Models/Question bank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SkillTest(),
    );
  }
}

class SkillTest extends StatefulWidget {
  const SkillTest({super.key});

  @override
  State<SkillTest> createState() => _SkillTestState();
}

class _SkillTestState extends State<SkillTest> {
  // ignore: non_constant_identifier_names
  List<Widget> AnswerOfQuestion = [];

  QuestionBank questionBank = QuestionBank();

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questionBank.getQuestionAnswer();
    if (correctAnswer == userAnswer) {
      AnswerOfQuestion.add(
        // ignore: prefer_const_constructors
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      AnswerOfQuestion.add(
        const Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    setState(() {
      questionBank.nextQuestionIndex();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 6,
              child: Center(
                child: Text(
                  questionBank.getQuestionText(),
                  style: const TextStyle(color: Colors.green, fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      checkAnswer(true);
                    },
                    child: Container(
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: Colors.teal),
                        // ignore: prefer_const_constructors
                        child: Center(
                          child: const Text(
                            "True",
                            style: TextStyle(fontSize: 25, color: Colors.white),
                          ),
                        )),
                  ))),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    checkAnswer(false);
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.redAccent),
                    child: const Center(
                      child: Text(
                        "False",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                )),
          ),
          Row(
            children: AnswerOfQuestion,
          )
        ],
      )),
    );
  }
}
