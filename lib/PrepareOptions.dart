import 'package:career_map/accentureApti.dart';
import 'package:career_map/chatWithExpert.dart';
import 'package:career_map/expertsIntroPage.dart';
import 'package:career_map/interviewPreparePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlacementPreparationScreen extends StatefulWidget {
  const PlacementPreparationScreen({super.key});
  @override
  State createState() => _PlacementPreparationScreenState();
}

class _PlacementPreparationScreenState
    extends State<PlacementPreparationScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image at the top with text overlay
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.37,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/prepare.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 225,
                  left: 20,
                  child: Text(
                    '''Lets start buddy...''',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black.withOpacity(0.7),
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Cards with background image
            Stack(
              children: [
                // Background image for cards
                Container(
                  width: screenWidth,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/back.webp'), // Background image for cards
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      buildOptionCard(
                          context, 'Aptitude', 'assets/apti.jpg', 1),
                      const SizedBox(height: 16),
                      buildOptionCard(
                          context, 'Interview', 'assets/interview.jpg', 2),
                      const SizedBox(height: 16),
                      buildOptionCard(
                          context, 'Group Discussion', 'assets/gd.avif', 3),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.only(left: 210.0),
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const ExpertsListPage();
          }));
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                    image: DecorationImage(
                                        image: AssetImage("assets/chat.jpg"),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const Text(
                              "Chat with expert",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOptionCard(
      BuildContext context, String title, String imagePath, int optionIndex) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        if (optionIndex == 1) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const AccentureInfoPage();
          }));
        }
        if (optionIndex == 2) {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const InterviewPreparePage();
          }));
        }
      },
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: screenWidth * 0.9,
          height: screenWidth * 0.23,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 58, 79, 96), width: 0.5),
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
            gradient: LinearGradient(
              colors: [Colors.blueAccent.withOpacity(0.2), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blueAccent.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: const Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
