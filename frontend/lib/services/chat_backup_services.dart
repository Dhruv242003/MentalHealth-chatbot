import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> getChatbotResponse(String message) async {
  final response = await http.post(
    Uri.parse('https://your-chatbot-api-url.com'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'message': message,
    }),
  );

  if (response.statusCode == 200) {
    final responseJson = jsonDecode(response.body);
    return responseJson['response'];
  } else {
    throw Exception('Failed to get chatbot response.');
  }
}

void createPost() async {
  final response = await http
      .post(Uri.parse('https://jsonplaceholder.typicode.com/posts'), body: {
    'title': 'My Test Post',
    'body': 'This is the body of my test post.',
    'userId': '1'
  });

  if (response.statusCode == 201) {
    dynamic newPost = jsonDecode(response.body);
    print('New post created with ID: ${newPost['id']}');
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}


