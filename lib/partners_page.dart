import 'package:flutter/material.dart';

class PartnersPage extends StatelessWidget {
  // Hardcoded partner data
  final List<String> partners = [
    'Apple',
    'Dell',
    'HP',
    'Microsoft',
    'Google',
    'Samsung',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/nett.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content overlay
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: partners.length,
              itemBuilder: (context, index) {
                final partnerName = partners[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0), // Space between rows
                  child: PartnerCard(partnerName: partnerName),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Partner card widget
class PartnerCard extends StatelessWidget {
  final String partnerName;

  const PartnerCard({Key? key, required this.partnerName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 10,
      child: Card(
        elevation: 4,
        color: Colors.black.withOpacity(0.7), // Black card with transparency
        child: Center(
          child: Text(
            partnerName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14, // Small font size
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text for better contrast
            ),
          ),
        ),
      ),
    );
  }
}


