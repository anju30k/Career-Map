import 'package:flutter/material.dart';

class UserProgressPage extends StatefulWidget {
  final double
      materialUsage; // Value between 0 and 1 (percentage of material used)
  final double quizScore; // Value between 0 and 1 (average quiz score)

  const UserProgressPage({
    Key? key,
    required this.materialUsage,
    required this.quizScore,
  }) : super(key: key);

  @override
  _UserProgressPageState createState() => _UserProgressPageState();
}

class _UserProgressPageState extends State<UserProgressPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _materialProgressAnimation;
  late Animation<double> _quizProgressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _materialProgressAnimation = Tween<double>(
      begin: 0,
      end: widget.materialUsage,
    ).animate(_controller);

    _quizProgressAnimation = Tween<double>(
      begin: 0,
      end: widget.quizScore,
    ).animate(_controller);

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen height and width for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenHeight * 0.02),
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage(
                    "assets/ProgressProfile.avif",
                  ), // Replace with user's profile picture URL
                ),
                SizedBox(height: screenHeight * 0.015),
                const Text(
                  'Welcome Buddy!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                const Text(
                  'Here’s an overview of your progress:',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                _buildCircularProgressSection(
                  'Material Usage',
                  _materialProgressAnimation,
                  const Color.fromARGB(255, 194, 181, 65),
                  Icons.book,
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(height: screenHeight * 0.02),
                _buildCircularProgressSection(
                  'Quiz Scores',
                  _quizProgressAnimation,
                  const Color.fromARGB(255, 114, 168, 56),
                  Icons.school,
                  screenWidth,
                  screenHeight,
                ),
                SizedBox(height: screenHeight * 0.04),
                const Text(
                  'Keep pushing forward!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: screenHeight * 0.015),
                const Text(
                  '“Success is the sum of small efforts, repeated day in and day out.”',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                    fontStyle: FontStyle.italic,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.03),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCircularProgressSection(
      String title,
      Animation<double> progressAnimation,
      Color color,
      IconData icon,
      double screenWidth,
      double screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black87, size: 28),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.015),
        AnimatedBuilder(
          animation: progressAnimation,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: screenWidth * 0.33,
                  height: screenWidth * 0.33,
                  child: CircularProgressIndicator(
                    value: progressAnimation.value,
                    strokeWidth: 10,
                    backgroundColor: Colors.black.withOpacity(0.1),
                    valueColor: AlwaysStoppedAnimation<Color>(color),
                  ),
                ),
                Text(
                  '${(progressAnimation.value * 100).toStringAsFixed(1)}%',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: 8),
        const Divider(
          color: Colors.black38,
          thickness: 1,
          indent: 30,
          endIndent: 30,
        ),
      ],
    );
  }
}
