import 'package:flutter/material.dart';

class CareersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nett.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSectionTitle('Job Opportunities'),
                buildSectionContent('Unavailable at the moment'),
                SizedBox(height: 30),
                buildSectionTitle('Internship Opportunities'),
                buildSectionContent('Unavailable at the moment'),
                SizedBox(height: 30),
                buildSectionTitle('Attachment Opportunities'),
                buildSectionContent('Unavailable at the moment'),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, color: Colors.white),
    );
  }

  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(color: Colors.yellowAccent, fontSize: 12),
    );
  }
}

