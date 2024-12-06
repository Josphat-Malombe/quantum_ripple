import 'package:flutter/material.dart';
import 'package:quantumwavetech/careers_page.dart';
import 'package:quantumwavetech/bot/chat.dart';
import 'about_page.dart';
import 'products_page.dart';
import 'services_page.dart';
import 'contact_page.dart';
import 'core_team_page.dart';
import 'partners_page.dart';
import 'success_page.dart';
import 'message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quantum Ripple',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeContent(),
    ProductsPage(),
    ServicesPage(),
    AboutUsPage(),
    ContactUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          // Top Navigation Buttons
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavButton('Home', 0),
                _buildNavButton('Products', 1),
                _buildNavButton('Services', 2),
                _buildNavButton('About Us', 3),
                _buildNavButton('Contact Us', 4),
              ],
            ),
          ),

          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildNavButton(String title, int index) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          _selectedIndex == index ? Colors.lightGreen: Colors.grey ,

        ),
        foregroundColor: MaterialStateProperty.all(Colors.white)
            
      ),

      child: Text(title),
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
                    'Our customer service team is dedicated to providing support and assistance, ensuring a smooth experience.',
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

                // "Contact Us" section (Now at the end)
                _buildSection('Contact Us', [

                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                    children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PartnersPage()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text("Partnerships")
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SuccessStoriesPage()));
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text("Success Stories")
                    ),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text("Innovation Lab"),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey),
                        foregroundColor: MaterialStateProperty.all(Colors.white),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CareersPage()));

                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                        child: Text("Careers"),
                    ),
                      ElevatedButton(
                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Chat()));
                          } ,
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.grey),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                        ),
                          child: Text("Chat With Us"),
                      ),


                    ],
                  ),
                  SizedBox(height: 30,),


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















