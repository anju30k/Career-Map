import 'package:career_map/interviewQuesAnsPage.dart';
import 'package:flutter/material.dart';

class InterviewPreparePage extends StatefulWidget {
  const InterviewPreparePage({super.key});

  @override
  State createState() => _InterviewPreparePageState();
}

class _InterviewPreparePageState extends State<InterviewPreparePage> {
  // List of interview topics
  /* at the time of passing the specific list to the next page that
      each topic has saperate questions, so we have to use the substring concepts 
      for the list passing ,we should match the substrings of list name and topic name 
      is contains then pass
      so names should be very careful and unique 
      on tapping that company we should track that companies backend from start
  */
  final List<String> topicList = [
    "Self Introduction",
    "Java Questions",
    "Project Questions",
    "Internship Questions",
  ];

  @override
  Widget build(BuildContext context) {
    // Screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interview Preparation'),
        backgroundColor: const Color.fromARGB(255, 123, 201, 201),
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
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 229, 245, 251),
                      Color.fromARGB(255, 173, 232, 244),
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
                  child: Column(
                    children: [
                      Text(
                        '# Interview Preparation Guide\n\n'
                        '1. Self Introduction: Tips and best practices\n'
                        '2. Java Questions: Common technical questions\n'
                        '3. Project Questions: How to explain your projects\n'
                        '4. Internship Questions: Discussing your experiences\n\n',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 17, 17, 17),
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      // Interview Progress Bar
                      LinearProgressIndicator(
                        value: 0.5, // Simulating half progress for demo
                        backgroundColor: Colors.grey.shade300,
                        color: Colors.blueAccent,
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        '50% Completed',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              // List of Topic Cards
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: topicList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if(topicList[index].contains("Java")){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const QuestionsPage();
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
                              Colors.lightGreen.withOpacity(0.1),
                              Colors.blueAccent.withOpacity(0.1),
                              Colors.white
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(
                            Icons.check_circle,
                            color: Colors.teal,
                          ),
                          title: Text(
                            topicList[index],
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.teal,
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
