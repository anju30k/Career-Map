import 'package:flutter/material.dart';
import 'jDoodle_Service.dart'; // Import the JDoodle service

class CodingQuestionPage extends StatefulWidget {
  @override
  _CodingQuestionPageState createState() => _CodingQuestionPageState();
}

class _CodingQuestionPageState extends State<CodingQuestionPage> {
  // List of coding questions
  List<Map<String, String>> codingQusList = [
    {
      "ques":
          """The function def differenceofSum(n, m) accepts two integers n, m as arguments. Find the sum of all numbers in range from 1 to m(both inclusive) that are not divisible by n. Return difference between sum of integers not divisible by n with sum of numbers divisible by n.

Assumption:

n>0 and m>0
Sum lies between integral range
Example

Input
n:4
m:20
Output
90""",
      "ans": """import java.util.*;
class Solution 
{
    public static int differenceOfSum (int m, int n) 
    {
        int sum1 = 0, sum2 = 0;
        for (int i = 1; i <= m; i++)
        {
            if (i % n == 0)
                sum1 = sum1 + i;
            else    
                sum2 = sum2 + i;
        }
        return Math.abs(sum1 - sum2);
    }
    public static void main(String[] args)
    {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int m = sc.nextInt();
        System.out.println(differenceOfSum(m, n));
    }
}
"""
    },
  ];

  // Track whether the code editor is visible for each question
  List<bool> isEditorVisible = [];
  List<bool> isAnswerVisible = [];
  TextEditingController _codeController = TextEditingController();
  String _compileResult = ''; // Store the result of code compilation
  bool isLoading = false; // To show loading state

  @override
  void initState() {
    super.initState();
    isEditorVisible = List<bool>.filled(codingQusList.length, false);
    isAnswerVisible = List<bool>.filled(codingQusList.length, false);
  }

  // Function to toggle code editor visibility
  void toggleEditorVisibility(int index) {
    setState(() {
      isEditorVisible[index] = !isEditorVisible[index];
    });
  }

  // Function to toggle answer visibility
  void toggleAnswerVisibility(int index) {
    setState(() {
      isAnswerVisible[index] = !isAnswerVisible[index];
    });
  }

  // Function to compile and run code using JDoodle API
  Future<void> compileAndRunCode() async {
    setState(() {
      isLoading = true;
      _compileResult = ''; // Reset compile result
    });

    JDoodleService jdoodleService = JDoodleService();
    String result =
        await jdoodleService.compileAndRunCode(_codeController.text);

    setState(() {
      isLoading = false;
      _compileResult = result; // Display the result of compilation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Coding Practice"),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Colors.purple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color.fromARGB(255, 235, 236, 250)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: codingQusList.length,
          itemBuilder: (context, index) {
            return Card(
              color: const Color.fromARGB(255, 205, 211, 245),
              margin:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 8.0,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.code, color: Colors.blueAccent),
                        const SizedBox(width: 10),
                        Text(
                          "Q${index + 1}:",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      codingQusList[index]['ques']!,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 10),
                    if (isEditorVisible[index])
                      Column(
                        children: [
                          // Code editor
                          TextField(
                            maxLines: 10,
                            controller: _codeController,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Write your code here...",
                              hintStyle: TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: compileAndRunCode,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 246, 248, 252), // Background color
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    30), // Rounded corners
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : const Text("Compile and Run"),
                          ),
                          const SizedBox(height: 10),
                          // Display compilation result
                          if (_compileResult.isNotEmpty)
                            Text(
                              "Result:\n$_compileResult",
                              style: const TextStyle(
                                  fontSize: 14.0, color: Colors.green),
                            ),
                        ],
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => toggleEditorVisibility(index),
                        child: Text(
                          isEditorVisible[index] ? "Hide Compiler" : "Try Code",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 12, 40, 96)),
                        ),
                      ),
                    ),
                    if (isAnswerVisible[index])
                      Column(
                        children: [
                          const SizedBox(height: 10),
                          Text(
                            codingQusList[index]['ans']!,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'monospace',
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => toggleAnswerVisibility(index),
                        child: Text(
                          isAnswerVisible[index]
                              ? "Hide Solution"
                              : "View Solution",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 26, 44, 75)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
