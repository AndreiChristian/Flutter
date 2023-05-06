import 'package:quiz_app/quiz_question.dart';

const questions = [
  QuizQuestion("What is the main building block of Flutter UI?",
      ["Widgets", "Components", "Blocks", "Functions"]),
  QuizQuestion(
      "Which programming language is primarily used for developing Flutter apps?",
      ["Dart", "Java", "JavaScript", "Swift"]),
  QuizQuestion(
      "What is the purpose of the 'pubspec.yaml' file in a Flutter project?", [
    "Managing dependencies",
    "Styling the UI",
    "Defining routes",
    "Compiling the app"
  ]),
  QuizQuestion(
      "What is the widget used to create a scrollable list in Flutter?",
      ["ListView", "ScrollView", "ScrollList", "Column"]),
  QuizQuestion(
      "Which of the following is a state management solution for Flutter?",
      ["Provider", "React", "Angular", "Vue"]),
  QuizQuestion("What is the purpose of a 'StatefulWidget' in Flutter?", [
    "To create a widget that can change its state over time",
    "To create a static widget",
    "To create a widget that can only be used once",
    "To define the layout of the application"
  ]),
];
