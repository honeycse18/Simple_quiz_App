class Question {
  final String questionText;
  final List<Answer> answerList;
  Question(this.questionText, this.answerList);
}

class Answer {
  final String answerText;
  final bool isCorrect;
  Answer(this.answerText, this.isCorrect);
}

List<Question> getQuestion() {
  List<Question> list = [];
//Add question and answer here
  list.add(Question(
    "Who is the owner of flutter",
    [
      Answer("Samsang", false),
      Answer("Nokia", false),
      Answer("Apple", false),
      Answer("Google", true),
    ],
  ));

  list.add(Question(
    "Who developed the Flutter Framework\n and continues to maintain it today?",
    [
      Answer("Facebook", false),
      Answer("Microsoft", false),
      Answer("Oracle", false),
      Answer("Google", true),
    ],
  ));

  list.add(Question(
    "Which programming language is used to build Flutter applications?",
    [
      Answer("Kotlin", false),
      Answer("Dart", true),
      Answer("Java", false),
      Answer("Go", false),
    ],
  ));
  list.add(Question(
    "How many types of widgets are there in Flutter?",
    [
      Answer("4", false),
      Answer("7", false),
      Answer("8", false),
      Answer("2", true),
    ],
  ));
  list.add(Question(
    "When building for iOS, Flutter is\n restricted to an __ compilation strategy",
    [
      Answer("AOT", true),
      Answer("JIT", false),
      Answer("Transcompilation", false),
      Answer("Recompilation", false),
    ],
  ));
  list.add(Question(
    "A sequence of asynchronous Flutter events is known as a:",
    [
      Answer("Flow", false),
      Answer("Series", false),
      Answer("Current", false),
      Answer("Stream", true),
    ],
  ));
  list.add(Question(
    "Access to a cloud database through Flutter\n is available through which service?",
    [
      Answer("SQLite", false),
      Answer("Firebase Database", true),
      Answer("NOSQL", false),
      Answer("MYSQL", false),
    ],
  ));
  list.add(Question(
    "What element is used as an identifier\n for components when programming in Flutter?",
    [
      Answer("Widgets", false),
      Answer("Serial", false),
      Answer("Elements", false),
      Answer("Keys", true),
    ],
  ));
  list.add(Question(
    "What type of test can examine your code as a complete system?",
    [
      Answer(" Unit tests", false),
      Answer("Widget tests", false),
      Answer("Integration Tests", true),
      Answer("All of the above", false),
    ],
  ));
  list.add(Question(
    "What type of Flutter animation allows\n you to represent real-world behavior?",
    [
      Answer("Physics-based", true),
      Answer("Maths-based", false),
      Answer("Graph-based", false),
      Answer("Sim-based", false),
    ],
  ));

  list.add(Question(
    "Flutter boasts improved runtime performance over most application frameworks.",
    [
      Answer("True", true),
      Answer("False", false),
    ],
  ));
  return list;
}
