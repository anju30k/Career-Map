import 'package:career_map/chatWithExpert.dart';
import 'package:flutter/material.dart';

class ExpertsListPage extends StatefulWidget {
  const ExpertsListPage({super.key});

  @override
  State createState() => _ExpertsListPageState();
}

class _ExpertsListPageState extends State<ExpertsListPage> {
  // Sample data of placed experts
  final List<Map<String, String>> expertList = [
    {
      "name": "Yash Dhole",
      "profile_image": "assets/interview.jpg", // Use asset image for demo
      "batch": "2024",
      "role in company": "Software Developer"
    },
    {
      "name": "Manasi Wagh",
      "profile_image": "assets/interview.jpg",
      "batch": "2025",
      "role in company": "UI/UX Designer"
    },
    {
      "name": "Vaibhav Gawali",
      "profile_image": "assets/interview.jpg",
      "batch": "2022",
      "role in company": "Backend Engineer"
    },
    {
      "name": "Bhakti Satpute",
      "profile_image": "assets/interview.jpg",
      "batch": "2023",
      "role in company": "Frontend Developer"
    },
    {
      "name": "Anjali Kumbhar",
      "profile_image": "assets/interview.jpg",
      "batch": "2023",
      "role in company": "Frontend Developer"
    },
    {
      "name": "Sanket Bhapkar",
      "profile_image": "assets/interview.jpg",
      "batch": "2023",
      "role in company": "Frontend Developer & UI/UX Designer"
    },
    {
      "name": "Tanaya Bendale",
      "profile_image": "assets/interview.jpg",
      "batch": "2023",
      "role in company": "Frontend Developer"
    },
    {
      "name": "Pranav Pisal",
      "profile_image": "assets/interview.jpg",
      "batch": "2023",
      "role in company": "Frontend Developer"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Placed Experts'),
        backgroundColor: Color.fromARGB(255, 246, 241, 249),
      ),
      body: Padding(
        padding: EdgeInsets.only(
            top: screenWidth * 0.07,
            right: screenWidth * 0.025,
            left: screenWidth * 0.02),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two cards in one row
            crossAxisSpacing: screenWidth * 0.02,
            mainAxisSpacing: screenHeight * 0.02,
            childAspectRatio: 0.8, // Adjust the aspect ratio for card height
          ),
          itemCount: expertList.length,
          itemBuilder: (context, index) {
            final expert = expertList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ChatWithExpertPage();
                }));
              },
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                padding: EdgeInsets.all(screenWidth * 0.035),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Color.fromARGB(255, 184, 184, 184)!,
                      width: 1), // Thin border
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Profile Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          expert['profile_image']!,
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      // Expert Details
                      Text(
                        expert['name']!,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 142, 39, 221),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        'Batch: ${expert['batch']}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.005),
                      Text(
                        'Role: ${expert['role in company']}',
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
