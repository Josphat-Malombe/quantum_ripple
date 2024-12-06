import 'package:flutter/material.dart';

class CoreTeamPage extends StatelessWidget {
  final List<Map<String, String>> teamMembers = [
    {"name": "Oscar Mueke", "title": "Director"},
    {"name": "Josphat Malombe", "title": "Director"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Core Team'),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Meet Our Core Team",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: teamMembers.length,
                itemBuilder: (context, index) {
                  return _buildTeamMemberCard(
                    teamMembers[index]["name"]!,
                    teamMembers[index]["title"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMemberCard(String name, String title) {
    return Card(
      color: Colors.grey[850],
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        subtitle: Text(
          title,
          style: TextStyle(fontSize: 16, color: Colors.white70),
        ),
        leading: Icon(Icons.person, color: Colors.blueAccent),
      ),
    );
  }
}
