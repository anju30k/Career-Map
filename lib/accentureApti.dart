import 'package:career_map/accenturePreparePage.dart';
import 'package:career_map/codingQuesPage.dart';
import 'package:flutter/material.dart';
import "package:career_map/accentureApti.dart";

class AccentureInfoPage extends StatefulWidget {
  const AccentureInfoPage({super.key});

  @override
  State createState() => _AccentureInfoPageState();
}

class _AccentureInfoPageState extends State<AccentureInfoPage> {
  // List of topics to display as cards
  final List<String> topics = [
    'English Ability',
    'Critical Reasoning',
    'Abstract Reasoning',
    'Common Application and MS Office',
    'Pseudo Codes',
    'Network, Security & Cloud',
    'String',
    'Array'
  ];

  @override
  Widget build(BuildContext context) {
    // Screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accenture Aptitude'),
        backgroundColor: const Color.fromARGB(255, 201, 163, 201),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            children: [
              // Information Container
              Container(
                padding: EdgeInsets.all(screenWidth * 0.04),
                height: screenHeight * 0.3,
                width: screenWidth * 0.9, // Fixed size container
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(217, 228, 202, 240).withOpacity(0.3),
                      const Color.fromARGB(255, 66, 129, 255).withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black, width: 0.1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Text(
                    '# Accenture has 2 rounds\n\n'
                    '1. Cognitive Test\n'
                    '2. Coding Round\n\n'
                    '# In Cognitive Test there are topics like:\n'
                    'a. English Ability\n'
                    'b. Critical Reasoning\n'
                    'c. Abstract Reasoning\n'
                    'd. Common Application and MS Office\n'
                    'e. Pseudo Codes\n'
                    'f. Network, Security & Cloud\n\n'
                    '# Coding questions consist of:\n'
                    'a. String\n'
                    'b. Array',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 17, 17, 17),
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // List of Topic Cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topics.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      //pass the list from this page to change the data as per options
                      //if-else is give to pass different lists according to options
                      if (index == 0) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LectureQuestionsQuizPage();
                        }));
                      }
                      if (topics[index].contains("Array")) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CodingQuestionPage();
                        }));
                      }
                    },
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black, width: 0.5),
                      ),
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blueAccent.withOpacity(0.1),
                              Colors.purple.withOpacity(0.1),
                              Colors.white
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.check_circle,
                            color: Colors.deepPurple,
                          ),
                          title: Text(
                            topics[index],
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
