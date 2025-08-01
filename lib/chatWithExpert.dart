import 'package:flutter/material.dart';

class ChatWithExpertPage extends StatefulWidget {
  const ChatWithExpertPage({super.key});

  @override
  State createState() => _ChatWithExpertPageState();
}

class _ChatWithExpertPageState extends State<ChatWithExpertPage> {
  // List to store chat messages
  List<Map<String, dynamic>> messages = [
    {
      'text': 'Hello! I am your guide. How can I help you?',
      'isUser': false,
      'time': '10:00 AM'
    },
  ];

  // Controller for the message input field
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Expert'),
        backgroundColor: Color.fromRGBO(253, 248, 255, 1),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.03),
              child: ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final message = messages[messages.length - 1 - index];
                  return Align(
                    alignment: message['isUser']
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.01,
                      ),
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      constraints: BoxConstraints(
                        maxWidth: screenWidth * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: message['isUser']
                            ? Color.fromARGB(255, 134, 70, 246).withOpacity(0.8)
                            : Color.fromARGB(255, 51, 22, 114).withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: message['isUser']
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          Text(
                            message['text'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            message['time'],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: screenWidth * 0.03,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.03),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 143, 143, 143),
                        fontSize: screenWidth * 0.04,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                        vertical: screenHeight * 0.02,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) => _sendMessage(),
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  backgroundColor:
                      Color.fromARGB(255, 134, 70, 246).withOpacity(0.8),
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to send a message
  void _sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    setState(() {
      messages.add({
        'text': messageController.text.trim(),
        'isUser': true,
        'time': _getCurrentTime(),
      });
    });

    messageController.clear();

    // Simulate expert reply
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        messages.add({
          'text': 'Let me assist you with that...',
          'isUser': false,
          'time': _getCurrentTime(),
        });
      });
    });
  }

  // Function to get the current time
  String _getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour % 12 == 0 ? 12 : now.hour % 12;
    final minutes = now.minute.toString().padLeft(2, '0');
    final period = now.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minutes $period';
  }
}
