import 'dart:convert';
import 'package:http/http.dart' as http;

class JDoodleService {
  final String clientId = '678d82251d2879168b181b42d878dc73';  // Replace with your JDoodle Client ID
  final String clientSecret = 'd683017945e9f49438286ddcb56bd98b325f5ddcb9aa60d2b2f684cb34650dd6';  // Replace with your JDoodle Client Secret
  final String url = 'https://api.jdoodle.com/v1/execute';

  Future<String> compileAndRunCode(String script) async {
    var response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "clientId": clientId,
        "clientSecret": clientSecret,
        "script": script,
        "language": "java",  // Use "java" for Java language
        "versionIndex": "3",  // JDoodle's version index for Java 8
        "stdin": "",  // Input if needed (leave empty if not required)
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['output'];
    } else {
      return 'Error: ${response.statusCode}';
    }
  }
}
