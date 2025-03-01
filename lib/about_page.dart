import 'package:flutter/material.dart';

/// A professionally designed, scrollable About Us page for Quantum Ripple Ltd.
///
/// Features a futuristic layout with animated section transitions, a gradient
/// background, and visually distinct content blocks for an engaging experience.
class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildBackground(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 48),
                _buildSection(
                  title: 'Tagline',
                  content: 'The Wave of Innovation',
                  color: Colors.greenAccent,
                ),
                const SizedBox(height: 40),
                _buildSection(
                  title: 'Mission',
                  content:
                  'To deliver high-quality technology solutions and accessories that enhance productivity and drive technological advancements. We are committed to providing unparalleled services, fostering innovation, and creating lasting value for our customers and stakeholders.',
                  color: Colors.blueAccent,
                ),
                const SizedBox(height: 40),
                _buildSection(
                  title: 'Vision',
                  content:
                  'To be a universal leading provider of cutting-edge, innovative technology solutions that empower businesses and individuals to thrive in a digital universe.',
                  color: Colors.purpleAccent,
                ),
                const SizedBox(height: 40),
                _buildValuesSection(),
                const SizedBox(height: 40),
                _buildSection(
                  title: 'History',
                  content:
                  'We rely not so much on our past but rather on our future—that’s where we aim to make a difference. Curious about how we came to be? Visit our offices for the full story. There’s coffee waiting!',
                  color: Colors.orangeAccent,
                ),
                const SizedBox(height: 40),
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Creates a gradient background with a subtle image overlay.
  BoxDecoration _buildBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.black87, Colors.grey.shade900],
      ),
      image: const DecorationImage(
        image: AssetImage('assets/images/nett.jpeg'),
        fit: BoxFit.cover,
        opacity: 0.15,
      ),
    );
  }

  /// Builds the page header with a bold title and subtitle.
  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Quantum Ripple',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          'Pioneering the Future of Technology',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white.withOpacity(0.7),
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  /// Builds a generic section with a title and content.
  Widget _buildSection({
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: color, width: 4)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withOpacity(0.9),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the Values section with a custom list layout.
  Widget _buildValuesSection() {
    final values = [
      'Innovation',
      'Teamwork',
      'Sustainability',
      'Simplicity',
      'Transformational Leadership',
    ];

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
        border: const Border(left: BorderSide(color: Colors.cyan, width: 4)),
        boxShadow: [
          BoxShadow(
            color: Colors.cyan.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Values',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.cyan,
            ),
          ),
          const SizedBox(height: 12),
          ...values.map(
                (value) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Icon(
                    Icons.fiber_manual_record,
                    size: 12,
                    color: Colors.cyan.withOpacity(0.8),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      value,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Builds a footer with a closing statement.
  Widget _buildFooter() {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.greenAccent.withOpacity(0.2),
            ),
            child: const Icon(
              Icons.waves,
              size: 40,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Join us in shaping the future.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white.withOpacity(0.8),
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}