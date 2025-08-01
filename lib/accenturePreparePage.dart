import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LectureQuestionsQuizPage extends StatefulWidget {
  const LectureQuestionsQuizPage({super.key});

  @override
  State createState() => _LectureQuestionsQuizPageState();
}

class _LectureQuestionsQuizPageState extends State<LectureQuestionsQuizPage>
    with SingleTickerProviderStateMixin {
  // Sample lecture list
  final List<Map<String, String>> lectureList = [
    {
      "topicName": "Sentence correction",
      "link": "https://www.youtube.com/watch?v=PxGtX0jEc20",
    },
    {
      "topicName": "Grammer",
      "link": "https://www.youtube.com/watch?v=WTcb_3lVwvc",
    },
    {
      "topicName": "Prepositions",
      "link": "https://www.youtube.com/watch?v=WTcb_3lVwvc",
    },
    {
      "topicName": "Antonyms & Synonyms",
      "link": "https://www.youtube.com/watch?v=WTcb_3lVwvc",
    },
  ];

  // Sample questions list
  final List<Map<String, dynamic>> quesList = [
    {
      "ques": "What is the antonym for the given word\n'ENORMOUS'",
      "options": ["Soft", "Average", "Tiny", "Weak"],
      "answer": "Tiny",
      "expln": "This is a demo of the explanation."
    },
    {
      "ques": "What is the antonym for the given word\n'ENORMOUS'",
      "options": ["Soft", "Average", "Tiny", "Weak"],
      "answer": "Tiny",
      "expln": "This is a demo of the explanation."
    },
    {
      "ques": "What is the antonym for the given word\n'ENORMOUS'",
      "options": ["Soft", "Average", "Tiny", "Weak"],
      "answer": "Tiny",
      "expln": "This is a demo of the explanation."
    },
    {
      "ques": "What is the antonym for the given word\n'ENORMOUS'",
      "options": ["Soft", "Average", "Tiny", "Weak"],
      "answer": "Tiny",
      "expln": "This is a demo of the explanation."
    },
    {
      "ques": "What is the antonym for the given word\n'ENORMOUS'",
      "options": ["Soft", "Average", "Tiny", "Weak"],
      "answer": "Tiny",
      "expln": "This is a demo of the explanation."
    },
  ];

  // To keep track of the selected option in the quiz and answers
  Map<int, String> selectedOptions = {};
  Map<int, bool> isAnswered = {};
  int score = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // Initialize maps
    for (int i = 0; i < quesList.length; i++) {
      selectedOptions[i] = "";
      isAnswered[i] = false;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  void _handleOptionTap(int index, String option) {
    if (!isAnswered[index]!) {
      setState(() {
        selectedOptions[index] = option;
        isAnswered[index] = true;
        if (option == quesList[index]["answer"]) {
          score++;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Material'),
        backgroundColor: const Color.fromARGB(255, 231, 225, 243),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Lectures'),
            Tab(text: 'Questions'),
            Tab(text: 'Quiz'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Lectures Page
          _buildLecturesPage(screenHeight, screenWidth),
          // Questions Page
          _buildQuestionsPage(screenHeight, screenWidth),
          // Quiz Page
          _buildQuizPage(screenHeight, screenWidth),
        ],
      ),
    );
  }

  Widget _buildLecturesPage(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: lectureList.map((lecture) {
            return Card(
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              elevation: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(217, 228, 202, 240).withOpacity(0.3),
                      const Color.fromARGB(255, 66, 129, 255).withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: ListTile(
                  title: Text(
                    lecture["topicName"]!,
                    style: TextStyle(
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: GestureDetector(
                    onTap: () => _launchURL(lecture["link"]!),
                    child: Text(
                      lecture["link"]!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildQuestionsPage(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.01),
        child: Column(
          children: quesList.asMap().entries.map((entry) {
            int index = entry.key;
            var question = entry.value;
            return Container(
              height: screenHeight * 0.32,
              width: screenWidth * 0.9,
              margin: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
              padding: EdgeInsets.all(screenWidth * 0.04),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    const Color.fromARGB(217, 228, 202, 240).withOpacity(0.3),
                    const Color.fromARGB(255, 66, 129, 255).withOpacity(0.3),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question["ques"]!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.015),
                    const Text(
                      "Options",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.deepPurple),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ...question["options"].map<Widget>((option) {
                      return Text(
                        "$option",
                        style: TextStyle(fontSize: screenWidth * 0.04),
                      );
                    }).toList(),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      'Answer: ${question["answer"]}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildQuizPage(double screenHeight, double screenWidth) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            Text(
              'Score: $score',
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            ...quesList.asMap().entries.map((entry) {
              int index = entry.key;
              var question = entry.value;
              bool showExplanation = isAnswered[index]!;

              return Container(
                margin: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                padding: EdgeInsets.all(screenWidth * 0.04),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(217, 228, 202, 240).withOpacity(0.3),
                      const Color.fromARGB(255, 66, 129, 255).withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question["ques"]!,
                      style: TextStyle(
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    ...question["options"].map<Widget>((option) {
                      bool isSelected = selectedOptions[index] == option;
                      bool isCorrect = option == question["answer"];

                      return GestureDetector(
                        onTap: () {
                          _handleOptionTap(index, option);
                        },
                        child: Container(
                          width: screenWidth * 0.8,
                          margin: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.005),
                          padding: EdgeInsets.all(screenWidth * 0.03),
                          decoration: BoxDecoration(
                            color: isAnswered[index]!
                                ? (isSelected
                                    ? (isCorrect ? Colors.green : Colors.red)
                                    : (isCorrect ? Colors.green : Colors.white))
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.black),
                          ),
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    if (showExplanation)
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.01),
                        child: Text(
                          'Explanation: ${question["expln"]}',
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
