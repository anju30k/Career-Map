import 'package:flutter/material.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({super.key});
  @override
  State createState() => QuestionsPageState();
}

class QuestionsPageState extends State<QuestionsPage> {
  // List of interview questions and answers
  List<Map<String, String>> interviewQuesAnsList = [
    {
      "ques":
          "What is JVM? Why is Java called the Platform Independent Programming Language?",
      "ans":
          "A Java virtual machine (JVM) is a process virtual machine that can execute Java bytecode. Each Java source file is compiled into a bytecode file, which is executed by the JVM. Java was designed to allow application programs to be run on any platform, without being rewritten or recompiled. A JVM makes this possible because it is aware of the specific instruction lengths and other particularities of the hardware platform."
    },
    {
      "ques": "Explain the concept of OOPs in Java.",
      "ans":
          "OOP stands for Object-Oriented Programming. Java supports OOP concepts such as Inheritance, Encapsulation, Abstraction, and Polymorphism. OOP makes development and maintenance easier by promoting reusability and modularity."
    },
    // Add more questions and answers here
  ];

  // Keep track of which answers are visible
  List<bool> isAnswerVisible = [];

  @override
  void initState() {
    super.initState();
    // Initialize all answers to be hidden
    isAnswerVisible = List<bool>.filled(interviewQuesAnsList.length, false);
  }

  // Function to toggle answer visibility for a specific question
  void toggleAnswerVisibility(int index) {
    setState(() {
      isAnswerVisible[index] = !isAnswerVisible[index];
    });
  }

  // Function to show all answers at once
  void showAllAnswers() {
    setState(() {
      isAnswerVisible = List<bool>.filled(interviewQuesAnsList.length, true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interview Questions"),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: showAllAnswers,
            tooltip: 'Show All Answers',
          ),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: interviewQuesAnsList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 4.0,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Q${index + 1}. ${interviewQuesAnsList[index]['ques']}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (isAnswerVisible[index])
                    Text(
                      interviewQuesAnsList[index]['ans']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => toggleAnswerVisibility(index),
                      child: Text(isAnswerVisible[index]
                          ? "Hide Answer"
                          : "Show Answer"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
