

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A modern, split-screen Contact Us page for Quantum Ripple Ltd.
///
/// Features a futuristic design with a left panel for contact info and a right
/// panel for interactive elements, overlaid on a dynamic gradient background.
class ContactUsPage extends StatelessWidget {
  // Contact constants
  static const String _email = "quantumrippleltd@gmail.com";
  static const String _phone = "+254763329346";
  static const String _twitterUrl = "https://x.com/quantumrippleKE";
  static const String _instagramUrl = "https://instagram.com/quantumrippleKE";

  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _buildGradientBackground(),
        child: Row(
          children: [
            // Left Panel: Contact Info
            Expanded(
              flex: 1,
              child: _buildLeftPanel(),
            ),
            // Right Panel: Interactive Elements
            Expanded(
              flex: 1,
              child: _buildRightPanel(context),
            ),
          ],
        ),
      ),
    );
  }

  /// Creates a gradient background with a subtle image overlay.
  BoxDecoration _buildGradientBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.black87, Colors.blueGrey.shade900],
      ),
      image: const DecorationImage(
        image: AssetImage('assets/images/nett.jpeg'),
        fit: BoxFit.cover,
        opacity: 0.1,
      ),
    );
  }

  /// Builds the left panel with contact information.
  Widget _buildLeftPanel() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Quantum Ripple Ltd.',
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
              letterSpacing: 2.0,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'We’re here to connect with you.',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white70,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 48),
          _ContactCard(
            icon: Icons.email_outlined,
            label: 'Email',
            value: _email,
            color: Colors.blueAccent,
          ),
          const SizedBox(height: 24),
          _ContactCard(
            icon: Icons.phone_outlined,
            label: 'Phone',
            value: _phone,
            color: Colors.greenAccent,
          ),
        ],
      ),
    );
  }

  /// Builds the right panel with interactive buttons and social media.
  Widget _buildRightPanel(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        border: const Border(left: BorderSide(color: Colors.greenAccent, width: 2)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Reach Out',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 32),
          _InteractiveButton(
            icon: Icons.email,
            label: 'Send an Email',
            color: Colors.blueAccent,
            onPressed: () => _launchEmail(context),
          ),
          const SizedBox(height: 16),
          _InteractiveButton(
            icon: Icons.chat,
            label: 'Chat on WhatsApp',
            color: Colors.greenAccent,
            onPressed: () => _launchWhatsApp(context),
          ),
          const SizedBox(height: 48),
          const Text(
            'Connect Online',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialIcon(
                url: _twitterUrl,
                icon: FontAwesomeIcons.twitter,
                color: Colors.lightBlue,
              ),
              const SizedBox(width: 24),
              _SocialIcon(
                url: _instagramUrl,
                icon: FontAwesomeIcons.instagram,
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Launches email client with error handling.
  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: _email);
    await _launchUri(context, emailUri, 'email');
  }

  /// Launches WhatsApp with error handling.
  Future<void> _launchWhatsApp(BuildContext context) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$_phone");
    await _launchUri(context, whatsappUri, 'WhatsApp');
  }

  /// Generalized URI launcher with error feedback.
  Future<void> _launchUri(BuildContext context, Uri uri, String type) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showError(context, 'Could not launch $type');
      }
    } catch (e) {
      _showError(context, 'Error launching $type: $e');
    }
  }

  /// Shows an error message via SnackBar.
  void _showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

/// A card-style widget for displaying contact information.
class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// A futuristic button widget for interactive actions.
class _InteractiveButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _InteractiveButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 220,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.8), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// A circular social media icon widget.
class _SocialIcon extends StatelessWidget {
  final String url;
  final IconData icon;
  final Color color;

  const _SocialIcon({required this.url, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final Uri uri = Uri.parse(url);
        try {
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not launch URL')),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(0.2),
          border: Border.all(color: color, width: 2),
        ),
        child: FaIcon(icon, color: color, size: 28),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A professional Contact Us page widget for Quantum Ripple Ltd.
///
/// Displays contact information, social media links, and action buttons with a
/// visually appealing background and responsive design.
class ContactUsPage extends StatelessWidget {
  // Constants for contact information
  static const String _email = "quantumrippleltd@gmail.com";
  static const String _phone = "+254763329346";
  static const String _twitterUrl = "https://x.com/quantumrippleKE";
  static const String _instagramUrl = "https://instagram.com/quantumrippleKE";

  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBackgroundContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: 32),
                _buildContactSection(),
                const SizedBox(height: 48),
                _buildSocialMediaSection(),
                const SizedBox(height: 48),
                _buildActionButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds the background container with an overlay image.
  Widget _buildBackgroundContainer({required Widget child}) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/images/nett.jpeg'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
      ),
      child: child,
    );
  }

  /// Builds the header title.
  Widget _buildHeader() {
    return const Text(
      'Get in Touch',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Colors.green,
        letterSpacing: 1.2,
      ),
    );
  }

  /// Builds the contact information section.
  Widget _buildContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _ContactInfo(label: 'Email', value: _email),
        const SizedBox(height: 24),
        _ContactInfo(label: 'Phone', value: _phone),
      ],
    );
  }

  /// Builds the social media links section.
  Widget _buildSocialMediaSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Follow Us on Social Media',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _SocialMediaIcon(
              url: _twitterUrl,
              icon: FontAwesomeIcons.twitter,
              color: Colors.lightBlue,
            ),
            const SizedBox(width: 16),
            _SocialMediaIcon(
              url: _instagramUrl,
              icon: FontAwesomeIcons.instagram,
              color: Colors.pinkAccent,
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the action buttons for email and WhatsApp.
  Widget _buildActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _ActionButton(
          icon: Icons.email,
          label: 'Email Us',
          color: Colors.blue,
          onPressed: () => _launchEmail(context),
        ),
        _ActionButton(
          icon: Icons.phone,
          label: 'WhatsApp Us',
          color: Colors.green,
          onPressed: () => _launchWhatsApp(context),
        ),
      ],
    );
  }

  /// Launches email client with predefined email address.
  Future<void> _launchEmail(BuildContext context) async {
    final Uri emailUri = Uri(scheme: 'mailto', path: _email);
    await _launchUri(context, emailUri, 'email');
  }

  /// Launches WhatsApp with predefined phone number.
  Future<void> _launchWhatsApp(BuildContext context) async {
    final Uri whatsappUri = Uri.parse("https://wa.me/$_phone");
    await _launchUri(context, whatsappUri, 'WhatsApp');
  }

  /// Generalized URI launcher with error handling.
  Future<void> _launchUri(BuildContext context, Uri uri, String type) async {
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        _showErrorSnackBar(context, 'Could not launch $type');
      }
    } catch (e) {
      _showErrorSnackBar(context, 'Error launching $type: $e');
    }
  }

  /// Displays an error message using a SnackBar.
  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
}

/// reusable contact information widget.
class _ContactInfo extends StatelessWidget {
  final String label;
  final String value;

  const _ContactInfo({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

/// Reusable social media icon widget.
class _SocialMediaIcon extends StatelessWidget {
  final String url;
  final IconData icon;
  final Color color;

  const _SocialMediaIcon({required this.url, required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: color, size: 32),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        try {
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Could not launch URL')),
            );
          }
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e')),
          );
        }
      },
    );
  }
}

/// Reusable action button widget.
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white, size: 20),
      label: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 4,
      ),
    );
  }
}


*/