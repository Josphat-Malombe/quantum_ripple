import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

// Placeholder imports (assuming these are your enhanced pages)
import 'about_page.dart';
import 'contact_page.dart';
import 'products_page.dart';
import 'services_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: const HomeContent(),
        ),
      ),
      GoRoute(
        path: '/services',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: const ServicesPage(),
        ),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: const ProductsPage(),
        ),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: const AboutUsPage(),
        ),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: const ContactUsPage(),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quantum Ripple',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      routerConfig: _router,
    );
  }
}

/// Main layout widget providing a consistent app structure with navigation.
class MainLayout extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const MainLayout({super.key, required this.currentPath, required this.child});

  String _getPageTitle() {
    switch (currentPath) {
      case '/services':
        return 'Services - Quantum Ripple';
      case '/products':
        return 'Products - Quantum Ripple';
      case '/about':
        return 'About Us - Quantum Ripple';
      case '/contact':
        return 'Contact - Quantum Ripple';
      default:
        return 'Home - Quantum Ripple';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      html.document.title = _getPageTitle();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.9),
        elevation: 4,
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', height: 40),
            const SizedBox(width: 12),
            const Text(
              'Quantum Ripple',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavItem(title: 'Home', path: '/', currentPath: currentPath),
                _NavItem(title: 'Services', path: '/services', currentPath: currentPath),
                _NavItem(title: 'Products', path: '/products', currentPath: currentPath),
                _NavItem(title: 'About', path: '/about', currentPath: currentPath),
                _NavItem(title: 'Contact', path: '/contact', currentPath: currentPath),
              ],
            ),
          ),
        ],
      ),
      body: child,
    );
  }
}

/// Navigation item widget for the app bar.
class _NavItem extends StatelessWidget {
  final String title;
  final String path;
  final String currentPath;

  const _NavItem({required this.title, required this.path, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentPath == path;
    return GestureDetector(
      onTap: () => context.go(path),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.greenAccent : Colors.white.withOpacity(0.8),
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

/// Home page content with a professional, tech-inspired design.
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/nett.jpeg',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.5),
            colorBlendMode: BlendMode.darken,
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _buildHeroSection(context),
              _buildSection(
                context,
                'Why Choose Us',
                [
                  _buildFeatureCard('Expertise', 'Our team brings extensive experience to every project.'),
                  _buildFeatureCard('Innovation', 'We pioneer cutting-edge technology solutions.'),
                  _buildFeatureCard('Product Quality', 'Delivering only high-quality, reliable products.'),
                  _buildFeatureCard('Customer Service', 'Dedicated support tailored to your needs.'),
                  _buildFeatureCard('Technical Capabilities', 'Seamless, advanced solutions for all.'),
                ],
              ),
              _buildSection(
                context,
                'Our Services',
                [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildServiceCard(context, 'Delivery', 'Fast and reliable.', Icons.local_shipping),
                      _buildServiceCard(context, 'Installation', 'Professional setup.', Icons.build),
                      _buildServiceCard(context, 'Maintenance', 'Keeping tech in top condition.', Icons.settings),
                      _buildServiceCard(context, 'Consultation', 'Expert guidance.', Icons.question_answer),
                      _buildServiceCard(context, 'Customization', 'Tailored solutions.', Icons.color_lens),
                      _buildServiceCard(context,  'Software Development', 'Reliable Service.', Icons.computer),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildActionButton(context, 'Explore Services', '/services', Colors.grey),
                ],
              ),
              _buildSection(
                context,
                'Our Products',
                [
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    alignment: WrapAlignment.center,
                    children: [
                      _buildProductCard(context, 'HP Computers', 'High-performance desktops.', 'assets/images/comphp.jpeg'),
                      _buildProductCard(context, 'Dell Computers', 'Reliable workstations.', 'assets/images/compdell.jpeg'),
                      _buildProductCard(context, 'Apple iMac', 'Elegant all-in-ones.', 'assets/images/compmac.jpeg'),
                      _buildProductCard(context, 'HP Laptops', 'Lightweight power.', 'assets/images/lapihp.jpeg'),
                      _buildProductCard(context, 'Dell Laptops', 'Efficient portables.', 'assets/images/lapidell.jpeg'),
                      _buildProductCard(context, 'MacBooks', 'Sleek innovation.', 'assets/images/lapimac.jpeg'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _buildActionButton(context, 'Browse Products', '/products', Colors.grey),
                ],
              ),
              _buildSection(
                context,
                'About Us',
                [
                  _buildFeatureCard('Our Vision', 'To be a universal leading provider of cutting-edge, innovative technology solutions that empower businesses and individuals to thrive in a digital universe.'),
                  _buildFeatureCard('Our Mission', 'To deliver high-quality technology solutions and accessories that enhance productivity and drive technological advancements.'),
                  _buildFeatureCard('Our Values', 'Innovation, Teamwork, Sustainability, Simplicity, Transformational Leadership.'),
                ],
              ),
              _buildFooter(context),
            ],
          ),
        ),
      ],
    );
  }

  /// Hero section with company branding.
  Widget _buildHeroSection(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      child: Column(
        children: [
          const Text(
            'Quantum Ripple',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.5,
              shadows: [
                Shadow(blurRadius: 10, color: Colors.greenAccent, offset: Offset(0, 2)),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            'The Wave of Innovation',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white.withOpacity(0.8),
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildActionButton(context, 'Talk to Us', '/contact', Colors.blueAccent),
        ],
      ),
    );
  }

  /// Generic section builder with title and content.
  Widget _buildSection(BuildContext context, String title, List<Widget> content) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.greenAccent,
            ),
          ),
          const SizedBox(height: 24),
          ...content,
        ],
      ),
    );
  }

  /// Feature card for "Why Choose Us" and "About Us" sections.
  Widget _buildFeatureCard(String title, String content) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.greenAccent.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, color: Colors.greenAccent, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
          ),
        ],
      ),
    );
  }

  /// Service card with responsive sizing.
  Widget _buildServiceCard(BuildContext context, String title, String content, IconData icon) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 600 ? screenWidth * 0.4 : 200.0; // Responsive width

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.greenAccent),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.greenAccent, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Product card with responsive sizing.
  Widget _buildProductCard(BuildContext context, String title, String description, String image) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth < 600 ? screenWidth * 0.4 : 200.0; // Responsive width

    return Container(
      width: cardWidth,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              image,
              width: cardWidth * 0.6,
              height: cardWidth * 0.6,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: cardWidth * 0.6,
                height: cardWidth * 0.6,
                color: Colors.grey.shade800,
                child: const Icon(Icons.broken_image, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.greenAccent, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.7)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  /// Action button for navigation.
  Widget _buildActionButton(BuildContext context, String label, String path, Color color) {
    return ElevatedButton(
      onPressed: () => context.go(path),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  /// Footer with contact info, links, and socials.
  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      color: Colors.black87,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/images/logo.jpg', height: 40),
              const SizedBox(width: 12),
              const Text(
                'Quantum Ripple',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.greenAccent),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'The Wave of Innovation',
            style: TextStyle(fontSize: 16, color: Colors.white.withOpacity(0.7), fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildFooterColumn(
                'Contact Us',
                [
                  _buildFooterText('Email: quantumrippleltd@gmail.com'),
                  _buildFooterText('Phone: +254763329346'),
                  _buildFooterText('Address: Athi-River, Machakos'),
                ],
              ),
              _buildFooterColumn(
                'Quick Links',
                [
                  _buildFooterLink(context, 'Home', '/'),
                  _buildFooterLink(context, 'Services', '/services'),
                  _buildFooterLink(context, 'Products', '/products'),
                  _buildFooterLink(context, 'About', '/about'),
                  _buildFooterLink(context, 'Contact', '/contact'),
                ],
              ),
              _buildFooterColumn(
                'Follow Us',
                [
                  _buildFooterSocial(Icons.facebook, 'Facebook', null),
                  _buildFooterSocial(Icons.trending_up, 'Twitter', 'https://twitter.com/QuantumRippleTech'),
                  _buildFooterSocial(Icons.link, 'LinkedIn', null),
                ],
              ),
            ],
          ),
          const SizedBox(height: 32),
          Divider(color: Colors.white.withOpacity(0.3)),
          const SizedBox(height: 16),
          Center(
            child: Text(
              '© ${DateTime.now().year} Quantum Ripple. All rights reserved.',
              style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.6)),
            ),
          ),
        ],
      ),
    );
  }

  /// Footer column builder.
  Widget _buildFooterColumn(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.greenAccent),
        ),
        const SizedBox(height: 12),
        ...children,
      ],
    );
  }

  /// Footer text widget.
  Widget _buildFooterText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Text(
        text,
        style: TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.8)),
      ),
    );
  }

  /// Footer link widget.
  Widget _buildFooterLink(BuildContext context, String text, String path) {
    return GestureDetector(
      onTap: () => context.go(path),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.8),
            decoration: TextDecoration.underline,
            decorationColor: Colors.greenAccent,
          ),
        ),
      ),
    );
  }

  /// Footer social link widget.
  Widget _buildFooterSocial(IconData icon, String text, String? url) {
    return GestureDetector(
      onTap: url != null ? () => _launchUrl(url) : null,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Row(
          children: [
            Icon(icon, size: 18, color: Colors.white.withOpacity(0.8)),
            const SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.8),
                decoration: url != null ? TextDecoration.underline : null,
                decorationColor: Colors.greenAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:html' as html;

// Placeholder imports
import 'about_page.dart';
import 'contact_page.dart';
import 'products_page.dart';
import 'services_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: HomeContent(),
        ),
      ),
      GoRoute(
        path: '/services',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: ServicesPage(),
        ),
      ),
      GoRoute(
        path: '/products',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: ProductsPage(),
        ),
      ),
      GoRoute(
        path: '/about',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: AboutUsPage(),
        ),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) => MainLayout(
          currentPath: state.uri.toString(),
          child: ContactUsPage(),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quantum Ripple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}

class MainLayout extends StatelessWidget {
  final String currentPath;
  final Widget child;

  const MainLayout({required this.currentPath, required this.child});

  String _getPageTitle() {
    switch (currentPath) {
      case '/services':
        return 'Services - Quantum Ripple';
      case '/products':
        return 'Products - Quantum Ripple';
      case '/about':
        return 'About Us - Quantum Ripple';
      case '/contact':
        return 'Contact - Quantum Ripple';
      default:
        return 'Home - Quantum Ripple';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      html.document.title = _getPageTitle();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min, // Minimize the logo/title section
              children: [
                Image.asset('assets/images/logo.jpg', height: 50),
                SizedBox(width: 8),
                Text(
                  'Quantum Ripple',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Flexible( // Use Flexible instead of Spacer for better control
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _NavItem(title: 'Home', path: '/', currentPath: currentPath),
                    _NavItem(title: 'Services', path: '/services', currentPath: currentPath),
                    _NavItem(title: 'Products', path: '/products', currentPath: currentPath),
                    _NavItem(title: 'About Us', path: '/about', currentPath: currentPath),
                    _NavItem(title: 'Contact', path: '/contact', currentPath: currentPath),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: child,
    );
  }
}

// Rest of the code (_NavItem, HomeContent, etc.) remains unchanged

class _NavItem extends StatelessWidget {
  final String title;
  final String path;
  final String currentPath;

  const _NavItem({required this.title, required this.path, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    final bool isActive = currentPath == path;
    return GestureDetector(
      onTap: () => context.go(path),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            color: isActive ? Colors.green : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/images/nett.jpeg', fit: BoxFit.cover),
        ),
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.6)),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 130),
                const Text(
                  'Quantum Ripple',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 5.0, color: Colors.green, offset: Offset(2, 2)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'The Wave of Innovation',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: [
                      Shadow(blurRadius: 10.0, color: Colors.black54, offset: Offset(2, 2)),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 75),
                ElevatedButton(
                  onPressed: () => context.go('/contact'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text("Talk To Us"),
                ),
                _buildSection('Why Choose Us', [
                  _buildFeatureText('Expertise', 'Our team has extensive experience.'),
                  _buildFeatureText('Innovation', 'Cutting-edge technology.'),
                  _buildFeatureText('Product Quality', 'High-quality products.'),
                  _buildFeatureText('Customer Service', 'Dedicated support.'),
                  _buildFeatureText('Technical Capabilities', 'Seamless solutions.'),
                ]),
                _buildSection('Our Services', [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildServiceCard('Delivery', 'Fast and reliable.', Icons.local_shipping),
                        _buildServiceCard('Installation', 'Professional services.', Icons.build),
                        _buildServiceCard('Maintenance', 'Top condition.', Icons.settings),
                        _buildServiceCard('Consultation', 'Expert advice.', Icons.question_answer),
                        _buildServiceCard('Customization', 'Tailored solutions.', Icons.color_lens),
                      ],
                    ),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () => context.go('/services'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text("Visit Services For More Information"),
                ),
                _buildSection('Our Products', [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildProductCard('HP Computers', 'High-performance.', 'assets/images/comphp.jpeg'),
                        _buildProductCard('Dell Computers', 'Reliable.', 'assets/images/compdell.jpeg'),
                        _buildProductCard('Apple iMac', 'Elegant.', 'assets/images/compmac.jpeg'),
                        _buildProductCard('HP Laptops', 'Lightweight.', 'assets/images/lapihp.jpeg'),
                        _buildProductCard('Dell Laptops', 'Efficient.', 'assets/images/lapidell.jpeg'),
                        _buildProductCard('MacBooks', 'Sleek.', 'assets/images/lapimac.jpeg'),
                      ],
                    ),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () => context.go('/products'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text("Visit Products For More Information"),
                ),
                _buildSection('About Us', [
                  _buildFeatureText('Our Vision', 'Leading tech solutions.'),
                  _buildFeatureText('Our Mission', 'High-quality solutions.'),
                  _buildFeatureText('Our Values', 'Innovation, Teamwork.'),
                ]),
                SizedBox(height: 60),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
                  color: Colors.black87,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/logo.jpg', height: 40),
                          SizedBox(width: 12),
                          Text(
                            'Quantum Ripple',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              shadows: [
                                Shadow(blurRadius: 3.0, color: Colors.black54, offset: Offset(1, 1)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Text(
                        'The Wave of Innovation',
                        style: TextStyle(fontSize: 14, color: Colors.white70, fontStyle: FontStyle.italic),
                      ),
                      SizedBox(height: 20),
                      Divider(color: Colors.white70, thickness: 0.5),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Contact Us', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                              SizedBox(height: 10),
                              _buildFooterText('Email: quantumrippleltd@gmail.com'),
                              _buildFooterText('Phone: +254763329346'),
                              _buildFooterText('Address: Athi-River, Machakos'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Quick Links', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                              SizedBox(height: 10),
                              _buildFooterLink(context, 'Home', '/'),
                              _buildFooterLink(context, 'Services', '/services'),
                              _buildFooterLink(context, 'Products', '/products'),
                              _buildFooterLink(context, 'About Us', '/about'),
                              _buildFooterLink(context, 'Contact', '/contact'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Follow Us', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
                              SizedBox(height: 10),
                              Row(children: [Icon(Icons.facebook, color: Colors.white70, size: 20), SizedBox(width: 5), _buildFooterText('Facebook')]),
                              GestureDetector(
                                onTap: () => _launchUrl('https://twitter.com/QuantumRippleTech'),
                                child: Row(
                                  children: [
                                    Icon(Icons.trending_up, color: Colors.white70, size: 20),
                                    SizedBox(width: 5),
                                    Text('Twitter', style: TextStyle(fontSize: 12, color: Colors.white70, decoration: TextDecoration.underline, decorationColor: Colors.green)),
                                  ],
                                ),
                              ),
                              Row(children: [Icon(Icons.link, color: Colors.white70, size: 20), SizedBox(width: 5), _buildFooterText('LinkedIn')]),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Divider(color: Colors.white70, thickness: 0.5),
                      SizedBox(height: 10),
                      Text(
                        '© ${DateTime.now().year} Quantum Ripple. All rights reserved.',
                        style: TextStyle(fontSize: 12, color: Colors.white60, letterSpacing: 0.5),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooterText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text, style: TextStyle(fontSize: 12, color: Colors.white70)),
    );
  }

  Widget _buildFooterLink(BuildContext context, String text, String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () => context.go(path),
        child: Text(
          text,
          style: TextStyle(fontSize: 12, color: Colors.white70, decoration: TextDecoration.underline, decorationColor: Colors.green),
        ),
      ),
    );
  }

  Widget _buildFeatureText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 20, color: Colors.green)),
          SizedBox(height: 8),
          Text(content, style: TextStyle(fontSize: 12, color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildServiceCard(String title, String content, IconData icon) {
    return Card(
      color: Colors.black87,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, size: 40, color: Colors.green),
            SizedBox(height: 15),
            Text(title, style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 8),
            Text(content, style: TextStyle(fontSize: 14, color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String description, String image) {
    return Card(
      color: Colors.black87,
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.asset(image, width: 120, height: 120),
            SizedBox(height: 8),
            Text(title, style: TextStyle(fontSize: 18, color: Colors.green)),
            SizedBox(height: 8),
            Text(description, style: TextStyle(fontSize: 14, color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent)),
          SizedBox(height: 20),
          Divider(color: Colors.white, thickness: 1.0),
          SizedBox(height: 20),
          ...content,
        ],
      ),
    );
  }
}



*/
















