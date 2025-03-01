




/*
import 'package:flutter/material.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'products_page.dart';
import 'services_page.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quantum Ripple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      home: HomePage(),

    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _selectedPage = HomeContent();
  String _activePage = 'Home';

  void _navigateTo(String pageTitle, Widget page) {
    setState(() {
      _selectedPage = page;
      _activePage = pageTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white38,
          elevation: 20, // Slight elevation for visibility
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/logo.jpg', height: 50),
                  SizedBox(width: 8),
                  Text(
                    'Quantum Ripple',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.none),
                  ),
                ],
              ),
              Spacer(), // Push navigation items to the right
              Flexible( // Prevents overflow
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _NavItem(title: 'Home', isActive: _activePage == 'Home', onTap: () => _navigateTo('Home', HomeContent())),
                    _NavItem(title: 'Services', isActive: _activePage == 'Services', onTap: () => _navigateTo('Services', ServicesPage())),
                    _NavItem(title: 'Products', isActive: _activePage == 'Products', onTap: () => _navigateTo('Products', ProductsPage())),
                    _NavItem(title: 'About Us', isActive: _activePage == 'About Us', onTap: () => _navigateTo('About Us', AboutUsPage())),
                    _NavItem(title: 'Contact', isActive: _activePage == 'Contact', onTap: () => _navigateTo('Contact', ContactUsPage())),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: HomeContent()
      );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  _NavItem({required this.title, required this.isActive, required this.onTap});

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {


  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  color: widget.isActive ? Colors.green : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isHovered)
                Container(
                  margin: EdgeInsets.only(top: 2),
                  height: 2,
                  width: 60,
                  color: Colors.blue,
                ),

    ],
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
            child: Image.asset(
              'assets/images/nett.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 130),
                      const Text(
                        'Quantum Ripple',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 5.0,
                              color: Colors.green,
                              offset: Offset(2, 2),
                            ),
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
                            Shadow(
                              blurRadius: 10.0,
                              color: Colors.black54,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 75),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text("Talk To Us"),
                  ),
                  _buildSection('Why Choose Us', [
                    _buildFeatureText('Expertise', 'Our team has extensive experience in the hardware industry.'),
                    _buildFeatureText('Innovation', 'We continuously innovate to provide cutting-edge technology.'),
                    _buildFeatureText('Product Quality', 'We offer high-quality products rigorously tested.'),
                    _buildFeatureText('Excellent Customer Service', 'Our team is dedicated to deliver what we promise.'),
                    _buildFeatureText('Technical Capabilities', 'We provide solutions that integrate seamlessly.'),
                  ]),
                    _buildSection('Our Services', [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildServiceCard('Delivery', 'Fast and reliable delivery service.', Icons.local_shipping),
                            _buildServiceCard('Installation', 'Professional installation services.', Icons.build),
                            _buildServiceCard('Maintenance', 'Regular maintenance to keep devices in top condition.', Icons.settings),
                            _buildServiceCard('Consultation', 'Expert consultation services.', Icons.question_answer),
                            _buildServiceCard('Customization', 'Tailored solutions to meet your needs.', Icons.color_lens),
                          ],
                        ),
                      ),
                    ]),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
                      },
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
                            _buildProductCard('HP Computers', 'High-performance HP computer.', 'assets/images/comphp.jpeg'),
                            _buildProductCard('Dell Computers', 'Reliable Dell computer.', 'assets/images/compdell.jpeg'),
                            _buildProductCard('Apple iMac', 'Powerful and elegant Apple iMac.', 'assets/images/compmac.jpeg'),
                            _buildProductCard('HP Laptops', 'Lightweight HP laptop.', 'assets/images/lapihp.jpeg'),
                            _buildProductCard('Dell Laptops', 'Efficient Dell laptop.', 'assets/images/lapidell.jpeg'),
                            _buildProductCard('MacBooks', 'Sleek MacBook.', 'assets/images/lapimac.jpeg'),
                          ],
                        ),
                      ),
                    ]),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage()));
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                      child: Text("Visit Products For More Information"),
                    ),
                    _buildSection('About Us', [
                      _buildFeatureText('Our Vision', 'To be a universal leading provider of innovative tech solutions.'),
                      _buildFeatureText('Our Mission', 'To deliver high-quality tech solutions and accessories.'),
                      _buildFeatureText('Our Values', 'Innovation, Teamwork, Sustainability, Simplicity, Leadership'),
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
                                    Shadow(
                                      blurRadius: 3.0,
                                      color: Colors.black54,
                                      offset: Offset(1, 1),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Text(
                            'The Wave of Innovation',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                              fontStyle: FontStyle.italic,
                            ),
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
                                  Text(
                                    'Contact Us',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildFooterText('Email: quantumrippleltd@gmail.com'),
                                  _buildFooterText('Phone: +254763329346'),
                                  _buildFooterText('Address: Athi-River, Machakos'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Quick Links',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  _buildFooterLink(context, 'Home', () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()))),
                                  _buildFooterLink(context, 'Services', () => Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()))),
                                  _buildFooterLink(context, 'Products', () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage()))),
                                  _buildFooterLink(context, 'About Us', () => Navigator.push(context, MaterialPageRoute(builder: (context) => AboutUsPage()))),
                                  _buildFooterLink(context, 'Contact', () => Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()))),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Follow Us',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Icon(Icons.facebook, color: Colors.white70, size: 20),
                                      SizedBox(width: 5),
                                      _buildFooterText('Facebook'),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () => _launchUrl('https://twitter.com/QuantumRippleTech'),
                                    child: Row(
                                      children: [
                                        Icon(Icons.trending_up, color: Colors.white70, size: 20),
                                        SizedBox(width: 5),
                                        Text(
                                          'Twitter',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white70,
                                            decoration: TextDecoration.underline,
                                            decorationColor: Colors.green,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.link, color: Colors.white70, size: 20),
                                      SizedBox(width: 5),
                                      _buildFooterText('LinkedIn'),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Divider(color: Colors.white70, thickness: 0.5),
                          SizedBox(height: 10),
                          Text(
                            '© ${DateTime.now().year} Quantum Ripple. All rights reserved.',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white60,
                              letterSpacing: 0.5,
                            ),
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
      child: Text(
        text,
        style: TextStyle(fontSize: 12, color: Colors.white70),
      ),
    );
  }

  Widget _buildFooterLink(BuildContext context, String text, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white70,
            decoration: TextDecoration.underline,
            decorationColor: Colors.green,
          ),
        ),
      ),
    );
  }

  Widget _buildContactOption(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text('$title: $content', style: TextStyle(fontSize: 10, color: Colors.white70)),
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
          Divider(color: Colors.white, thickness: 1.0, indent: 0, endIndent: 0),
          SizedBox(height: 20),
          ...content,
        ],
      ),
    );
  }
}

*/




/*


import 'package:flutter/material.dart';
import 'about_page.dart';
import 'contact_page.dart';
import 'products_page.dart';
import 'services_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quantum Ripple',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _selectedPage = HomeContent();
  String _activePage = 'Home';

  void _navigateTo(String pageTitle, Widget page) {
    setState(() {
      _selectedPage = page;
      _activePage = pageTitle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: Row(
          children: [
            Image.asset('assets/images/logo.jpg', height: 50),
            SizedBox(width: 8),
            Text(
              'Quantum Ripple',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Spacer(),
            Row(
              children: [
                _NavItem(title: 'Home', isActive: _activePage == 'Home', onTap: () => _navigateTo('Home', HomeContent())),
                _NavItem(title: 'Services', isActive: _activePage == 'Services', onTap: () => _navigateTo('Services', ServicesPage())),
                _NavItem(title: 'Products', isActive: _activePage == 'Products', onTap: () => _navigateTo('Products', ProductsPage())),
                _NavItem(title: 'About Us', isActive: _activePage == 'About Us', onTap: () => _navigateTo('About Us', AboutUsPage())),
                _NavItem(title: 'Contact', isActive: _activePage == 'Contact', onTap: () => _navigateTo('Contact', ContactUsPage())),
              ],
            ),
          ],
        ),
      ),
      body: _selectedPage,
    );
  }
}

class _NavItem extends StatefulWidget {
  final String title;
  final bool isActive;
  final VoidCallback onTap;

  _NavItem({required this.title, required this.isActive, required this.onTap});

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 18,
                  color: widget.isActive ? Colors.green : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (isHovered)
                Container(
                  margin: EdgeInsets.only(top: 2),
                  height: 2,
                  width: 60,
                  color: Colors.blue,
                ),
            ],
          ),
        ),
      ),
    );
  }
}


class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/nett.jpeg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // "Quantum Wave" branding text
                Column(
                  children: [
                    const SizedBox(height: 130),
                    const Text(
                      'Quantum Ripple',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 5.0,
                            color: Colors.green,
                            offset: Offset(2, 2),
                          ),
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
                          Shadow(
                            blurRadius: 10.0,
                            color: Colors.black54,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 75),




                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ContactUsPage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    child: Text("Talk To Us")
                ),

                // "Why Choose Us" section
                _buildSection('Why Choose Us', [
                  _buildFeatureText(
                    'Expertise',
                    'Our team has extensive experience in the hardware industry, ensuring you get the best solutions tailored to your needs.',
                  ),
                  _buildFeatureText(
                    'Innovation',
                    'We continuously innovate to provide cutting-edge technology that keeps you ahead in the fast-paced digital landscape.',
                  ),
                  _buildFeatureText(
                    'Product Quality',
                    'We offer high-quality products that are rigorously tested for performance and reliability.',
                  ),
                  _buildFeatureText(
                    'Excellent Customer Service',
                    'Our customer service team is dedicated to deliver what we promise , providing support and assistance and ensuring a smooth experience.',
                  ),
                  _buildFeatureText(
                    'Technical Capabilities',
                    'We possess the technical expertise to provide solutions that integrate seamlessly with your existing systems.',
                  ),
                ]),

                // "Our Services" section
                _buildSection('Our Services', [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildServiceCard('Delivery', 'Fast and reliable delivery service for all hardware products.', Icons.local_shipping),
                        _buildServiceCard('Installation', 'Professional installation services to set up your devices.', Icons.build),
                        _buildServiceCard('Maintenance', 'Regular maintenance services to keep your devices in top condition.', Icons.settings),
                        _buildServiceCard('Consultation', 'Expert consultation services to help you choose the right products.', Icons.question_answer),
                        _buildServiceCard('Customization', 'Tailored solutions to meet your specific hardware needs.', Icons.color_lens),
                      ],
                    ),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ServicesPage()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text("Visit Services For More Information"),
                ),

                // "Our Products" section
                _buildSection('Our Products', [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildProductCard('HP Computers', 'High-performance HP computer for personal and professional use.', 'assets/images/comphp.jpeg'),
                        _buildProductCard('Dell Computers', 'Reliable Dell computer for everyday tasks and gaming.', 'assets/images/compdell.jpeg'),
                        _buildProductCard('Apple iMac', 'Powerful and elegant Apple iMac for creative professionals.', 'assets/images/compmac.jpeg'),
                        _buildProductCard('HP Laptops', 'Lightweight HP laptop with powerful performance for work and play.', 'assets/images/lapihp.jpeg'),
                        _buildProductCard('Dell Laptops', 'Efficient Dell laptop with impressive battery life and speed.', 'assets/images/lapidell.jpeg'),
                        _buildProductCard('MacBooks', 'Sleek MacBook with exceptional performance and design.', 'assets/images/lapimac.jpeg'),
                      ],
                    ),
                  ),
                ]),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsPage()));
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                  child: Text("Visit Products For More Information"),
                ),

                // "About Us" section
                _buildSection('About Us', [
                  _buildFeatureText(
                    'Our Vision',
                    'To be a universal leading provider of cutting-edge innovative technology solutions that empower businesses and individuals to thrive in a digital universe',
                  ),
                  _buildFeatureText(
                    'Our Mission',
                    'To deliver a high quality technology solutions and accesories '
                        'that enhance productivity and drive technological advancements. '
                        'We are committed to providing unparralled services, '
                        'fostering innovation and creating a lasting value for our customers and stakeholders',
                  ),
                  _buildFeatureText(
                    'Our Values',
                    'We value Innovation, Teamwork, Sustainability, Simplicity and Transformative Leadership',
                  ),
                ]),





              ],
            ),
          ),
        ),
      ],
    );
  }


  Widget _buildContactOption(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        '$title: $content',
        style: TextStyle(fontSize: 10, color: Colors.white70),
      ),
    );
  }

  Widget _buildFeatureText(String title, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          SizedBox(height: 8),
          Text(
            content,
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
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
            Icon(
              icon,
              size: 40,
              color: Colors.green,
            ),
            SizedBox(height: 15),
            Text(
              title,
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              content,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
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
            Text(
              title,
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),

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
          Text(
            title,
            style: TextStyle( fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blueAccent,
            ),
          ),
          SizedBox(height: 20),
          Divider(color: Colors.white, thickness: 1.0, indent: 0, endIndent: 0,
          ),
          SizedBox(height: 20),
          ...content,
        ],
      ),
    );
  }
}
*/






