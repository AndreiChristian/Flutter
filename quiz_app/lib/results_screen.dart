import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers});

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text("You answered X/Y questions correctly"),
          const SizedBox(
            height: 30,
          ),
          QuestionsSummary(summaryData: getSummaryData()),
          const SizedBox(
            height: 30,
          ),
          TextButton(onPressed: () {}, child: const Text("Retake the quiz"))
        ]),
      ),
    );
  }
}
