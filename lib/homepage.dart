import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quiz_test/question_model.dart';
import 'package:quiz_test/quiz_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/img/3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 90,
                ),
                Image.asset(
                  'assets/img/q_logo.png',
                  scale: 5.0,
                ),
                Text(
                  "QUIZ TEST",
                  style: TextStyle(
                      color: Color.fromARGB(221, 0, 51, 75),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    'Flutter For Beginners',
                    style: TextStyle(
                      color: Color.fromARGB(221, 0, 51, 75),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Practice Test",
                  style: TextStyle(
                    color: Color.fromARGB(221, 0, 51, 75),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shadowColor: Colors.black,
                  ),
                  child: Text(
                    "Test 1",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: Text(
                    "Test 2",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => QuizScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent),
                  child: Text(
                    "Test 3",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
