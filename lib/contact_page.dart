import 'package:flutter/material.dart';
import 'package:quantumwavetech/bot/chat.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactUsPage extends StatelessWidget {
  final String email = "quantumrippleltd@gmail.com";
  final String phone = "+254763329346";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nett.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Get in Touch',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(height: 10),
                    contactInfo('Email: ', email),
                    SizedBox(height: 40),
                    contactInfo('Phone: ', phone),
                    SizedBox(height: 40),
                    Text(
                      'Follow us on Social Media',
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        socialMediaIcon('https://twitter.com/your_twitter_handle', FontAwesomeIcons.twitter, Colors.lightBlue),
                        socialMediaIcon('https://instagram.com/your_instagram_handle', FontAwesomeIcons.instagram, Colors.pinkAccent),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildButton(
                      icon: Icons.email,
                      label: 'Email Us',
                      color: Colors.blue,
                      onPressed: () => _launchEmail(email),
                    ),
                    buildButton(
                      icon: Icons.phone,
                      label: 'WhatsApp Us',
                      color: Colors.green,
                      onPressed: () => _launchWhatsApp(phone),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
                      },
                      icon: Icon(Icons.chat, color: Colors.white),
                      label: Text(
                        'Chat with Us',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget buildButton({required IconData icon, required String label, required Color color, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(label,
        style: TextStyle(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget contactInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget socialMediaIcon(String url, IconData icon, Color color) {
    return IconButton(
      icon: FaIcon(icon, color: color, size: 30), // Use FaIcon for Font Awesome icons
      onPressed: () {
        _launchUrl(url);
      },
    );
  }

  Future<void> _launchEmail(String email) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }

  Future<void> _launchWhatsApp(String phone) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$phone");
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri);
    } else {
      throw 'Could not launch $whatsappUri';
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse("https://x.com/quantumrippleKE");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}





