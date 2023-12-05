import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_test/question_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  //define the class
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //  backgroundColor: Color.fromARGB(255, 251, 163, 213),

        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          //  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Image.asset(
                  'assets/img/qs.png',
                  scale: 4.0,
                ),
                _questionWidget(),
                SizedBox(
                  height: 10,
                ),
                _answerList(),
                SizedBox(
                  height: 20,
                ),
                _nextButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _questionWidget() {
    return Column(
      children: [
        Text(
          "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
          style: TextStyle(
            color: Color.fromARGB(221, 0, 51, 75),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color.fromARGB(221, 0, 51, 75),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answerList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: ElevatedButton(
          child: Text(answer.answerText),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: isSelected ? Colors.pink : Colors.greenAccent,
            onPrimary: isSelected ? Colors.white : Colors.black,
          ),
          onPressed: () {
            if (selectedAnswer == null) {
              if (answer.isCorrect) {
                score++;
              }
              setState(() {
                selectedAnswer = answer;
              });
            }
          }),
    );
  }

  _nextButton() {
    bool isLastQuestion = false;
    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: 48,
      child: ElevatedButton(
          child: Text(isLastQuestion ? "submit" : "Next Question"),
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            primary: Color.fromARGB(221, 0, 51, 75),
            onPrimary: Colors.white,
          ),
          onPressed: () {
            if (isLastQuestion) {
              showDialog(context: context, builder: (_) => _showScoreDialog());
            } else {
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex++;
              });
            }
          }),
    );
  }

  _showScoreDialog() {
    bool isPassed = false;
    if (score >= questionList.length * 0.6) {
      isPassed = true;
    }
    String title = isPassed ? "Congratulations! You are Passed" : "Failed";
    return AlertDialog(
      backgroundColor: Color.fromARGB(255, 30, 223, 248),
      title: Text(
        title + "| Score is $score ",
        style: TextStyle(
          color: isPassed ? Colors.black : Color.fromARGB(255, 224, 15, 0),
        ),
      ),
      content: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
        style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            backgroundColor: Color.fromARGB(221, 0, 51, 75),
            shadowColor: Colors.black,
            ),
        child: Text(
          "Restart",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
