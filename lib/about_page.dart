import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nett.jpeg'),  // Update with your image path
            fit: BoxFit.cover,  // Ensure the image covers the whole container
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildSectionTitle('Tagline'),
                buildSectionContent("The wave of Innovation"),
                SizedBox(height: 30),
                buildSectionTitle('Mission'),
                buildSectionContent(
                  'To deliver a high quality technology solutions and accesories '
                  'that enhance productivity and drive technological advancements. '
                      'We are committed to providing unparralled services, '
                      'fostering innovation and creating a lasting value for our customers and stakeholders.',
                ),
                SizedBox(height: 30),
                buildSectionTitle('Vision'),
                buildSectionContent(
                  'To be a universal leading provider of cutting-edge innovative technology solutions that empower businesses and individuals to thrive in a digital universe',
                ),
                SizedBox(height: 30),
                buildSectionTitle('Values'),
                buildSectionContent(
                  "• Innovation "

                      "• Teamwork "

                      "• Sustainability "

                      "• Simplicity "

                      "• Transformational Leadership"
                ),
                SizedBox(height: 30),
                buildSectionTitle('History'),
                buildSectionContent(
                  "We rely not much at our past but rather at our future. "
                      "That is where we aim to make a difference. "
                      "But if you want to know more about how we came into existence visit our offices"
                      ". There is coffee!"
                ),
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
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.green),
    );
  }

  Widget buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 14, color: Colors.white),
    );
  }

}
