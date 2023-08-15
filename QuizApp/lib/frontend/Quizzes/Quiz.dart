import 'package:com.codsoft.quizApp/backend/Database/AccessDB.dart';
import 'package:com.codsoft.quizApp/frontend/Components/QAElevatedButton.dart';
import 'package:com.codsoft.quizApp/frontend/style/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Map<String, Map<String, dynamic>> questions = {};
  int currentQuestionIndex = 0;
  String selectedAnswer = "";
  bool answeredCorrectly = false;
  Map<String, bool> answersStatus = {};
  Map<String, String> answers = {};

  bool showScore = false;
  bool submit = false;

  User? currentUser;

  void checkAnswer(String selected) {
    String question = questions.keys.elementAt(currentQuestionIndex);
    var correctAnswer = questions[question]?['correctAnswer'];
    print('correct is $correctAnswer');
    setState(() {
      selectedAnswer = selected;
      answers[question] = selected;
      answeredCorrectly = selected == correctAnswer;
      answersStatus[question] = answeredCorrectly;
      print(answersStatus);
    });
  }

  void moveToNextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        selectedAnswer = "";
        answeredCorrectly = false;
      } else {
        submit = true;
      }
    });
  }

  int calculateScore() {
    int score = 0;
    answersStatus.forEach((key, value) {
      value ? score += 100 : score += 0;
    });

    return score;
  }

  @override
  void initState() {
    super.initState();
    currentUser = FirebaseAuth.instance.currentUser;
    fetchQuestions(); // Fetch questions when the widget is initialized
  }

  void fetchQuestions() async {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    Map<String, Map<String, dynamic>> fetchedQuestions =
        await AccessDB.getRandomQuestions(category, 5);
    setState(() {
      questions = fetchedQuestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as String;
    AccessDB.getRandomQuestions(category, 5).then((value) {
      setState(() {
        questions = value;
      });
    });
    int score = calculateScore();
    Map quiz;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myPrimaryPink,
        title: Text(
          'Quiz',
          style: TextStyle(color: MyColors.myBlack),
        ),
      ),
      body: Container(
        color: MyColors.myBlack,
        alignment: Alignment.center,
        child: questions.isEmpty
            ? CircularProgressIndicator(
                color: MyColors.myPrimaryPink,
              )
            : showScore
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Text(
                            'Each Question is worth 100 point',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24, color: MyColors.myPrimaryPink),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Your Score is\n $score point',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28, color: MyColors.myPrimaryPink),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: answersStatus.entries.map((entry) {
                              return Container(
                                alignment: Alignment.topCenter,
                                margin: const EdgeInsets.all(5.0),
                                child: Text(
                                  '${answers[entry.key]}: ${entry.value ? '✅' : '❌'}',
                                  style: TextStyle(
                                      color: MyColors.myPrimaryPink,
                                      fontSize: 20),
                                ),
                              );
                            }).toList(),
                          ),
                          QAElevatedButton(
                              onPressed: () => {
                                    print(score),
                                    quiz = {
                                      'email': currentUser?.email,
                                      'questionsStatus': answersStatus,
                                      'score': score,
                                    },
                                    print(score),
                                    AccessDB.addUserQuiz(quiz),
                                    Navigator.pushNamed(context, '/home')
                                  },
                              buttonText: "Get Quizzed Again",
                              color: MyColors.myPrimaryPink,
                              textColor: MyColors.myBlack)
                        ],
                      ),
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Question ${currentQuestionIndex + 1}/${questions.length}',
                        style: TextStyle(
                            fontSize: 26,
                            color: MyColors.myPrimaryPink,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 50.0, top: 30.0, right: 50.0),
                        child: Text(
                          questions.values
                              .elementAt(currentQuestionIndex)['question'],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            color: MyColors.myPrimaryPink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 40),
                      Column(
                        children: (questions.values
                                    .elementAt(currentQuestionIndex)['options']
                                as Map)
                            .entries
                            .map((option) => ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      selectedAnswer = option.key;
                                    });
                                    if (selectedAnswer.isNotEmpty) {
                                      checkAnswer(option.key);
                                    }
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        selectedAnswer == option.key
                                            ? (answeredCorrectly
                                                ? Colors.green
                                                : Colors.red)
                                            : MyColors.myPrimaryPink,
                                      ),
                                      padding: MaterialStateProperty.all(
                                          const EdgeInsets.only(
                                              top: 5,
                                              bottom: 5,
                                              left: 45,
                                              right: 45)),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                      )),
                                  child: Text(
                                    option.value,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ))
                            .toList(),
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      if (selectedAnswer.isNotEmpty && !submit)
                        QAElevatedButton(
                            onPressed: moveToNextQuestion,
                            buttonText: 'Next Question',
                            color: MyColors.myPrimaryPink,
                            textColor: MyColors.myBlack),
                      if (submit && selectedAnswer.isNotEmpty)
                        QAElevatedButton(
                            onPressed: () => {
                                  setState(() {
                                    showScore = true;
                                  })
                                },
                            buttonText: 'Submit',
                            color: MyColors.myPrimaryPink,
                            textColor: MyColors.myBlack)
                    ],
                  ),
      ),
    );
  }
}
