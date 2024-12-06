import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(Chat());
}

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green,
      ),
      home: ChatbotPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ChatbotPage extends StatefulWidget {
  @override
  _ChatbotPageState createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  TextEditingController _controller = TextEditingController();
  List<Map<String, String>> _messages = [];

  void _sendMessage() async {
    String message = _controller.text;
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'message': message});
      _controller.clear();
    });

    try {
      String chatbotResponse = await fetchChatbotResponse(message);
      setState(() {
        _messages.add({'sender': 'bot', 'message': chatbotResponse});
      });
    } catch (e) {
      setState(() {
        _messages.add({'sender': 'bot', 'message': 'Sorry, I am not trained yet!'});
      });
    }
  }

  Future<String> fetchChatbotResponse(String userInput) async {
    // Replace the API key before using in production.
    final response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': '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',
      },
      body: json.encode({
        'model': 'gpt-3.5-turbo',
        'messages': [
          {'role': 'user', 'content': userInput},
        ],
      }),
    );

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception('Failed to load chatbot response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: _messages[index]['message']!,
                    sender: _messages[index]['sender']!,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Ask me anything  about Quantum Ripple...',
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  IconButton(
                    icon: Icon(Icons.send, color: Colors.green),
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final String sender;

  ChatBubble({required this.message, required this.sender});

  @override
  Widget build(BuildContext context) {
    bool isUser = sender == 'user';
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          decoration: BoxDecoration(
            color: isUser ? null : Colors.white.withOpacity(0.1),
            gradient: isUser
                ? LinearGradient(
              colors: [Colors.greenAccent, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
                : null,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 5.0,
                offset: Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            message,
            style: TextStyle(
              color: isUser ? Colors.white : Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
