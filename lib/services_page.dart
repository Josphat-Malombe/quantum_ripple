import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/nett.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: services.length,
          itemBuilder: (context, index) {
            final service = services[index];
            return ServiceCard(
              title: service['title']!,
              description: service['description']!,
              icon: service['icon'] as IconData,
            );
          },
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;

  const ServiceCard({
    Key? key,
    required this.title,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0), // Space between cards
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjusts to content size
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.greenAccent,
            ),
            SizedBox(height: 16.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> services = [
  {
    'title': 'Importation',
    'description':
       'we specialize in the importation of high-quality computer hardware and accessories, bringing the latest and most reliable products directly to you. '
       'Whether you are upgrading your workstation, building a custom PC, or in need of essential peripherals, '
        'we got you covered with a diverse range of components including '
        'processors, motherboards, graphics cards, storage devices, keyboards, mice, and more. '
        'Our commitment to providing top-tier products ensures that you have the best technology at your fingertips,'
        ' backed by exceptional customer service. Trust us to deliver the tools you need to elevate your computing experience,'
        ' all at competitive prices and with fast, reliable shipping.',
    'icon': Icons.directions_boat_filled_rounded,
  },
  {
    'title': 'Delivery',
    'description':
        'At Quantum Ripple, we understand the importance of seamless service in the tech industry. '
        'That’s why we offer FREE delivery on all contracted orders, ensuring your computer hardware and accessories arrive quickly, safely, and at no extra cost. '
        'With our efficient and reliable delivery system, we guarantee that your contracted products will be transported with the utmost care, '
        'allowing you to focus on your business needs without worrying about logistics. Partner with us today and enjoy hassle-free delivery with every contract!',
    'icon': Icons.local_shipping,
  },


  {
    'title': 'Installation',
    'description':
    'At Quantum Ripple, we provide excellent quality installation services that you can trust.'
  ' Our team of highly trained engineers is dedicated to ensuring that your computer hardware and accessories are set up to perform at their best. '
  'With years of expertise in the industry, our engineers handle each installation with precision and care, guaranteeing that everything is up and running smoothly. '
  'Whether it is a simple set up or a complex system, we pride ourselves on delivering a seamless installation experience, '
        'tailored to meet your specific needs. Partner with us for top-notch service and peace of mind.',
    'icon': Icons.build,
  },


  {
    'title': 'Maintenance',
    'description':
        'At Quantum Ripple, our commitment to excellence doesn’t end with installation.'
        ' We offer comprehensive maintenance services to ensure the long-term performance and reliability of the systems and accessories '
        'we deliver and install. Our team of skilled technicians provides regular maintenance checks, troubleshooting, and upgrades, helping you avoid potential issues before they arise. '
        'Whether it’s equipment we’ve installed or existing systems, we are here to keep your technology running smoothly, efficiently, and safely. '
        'With Quantum Ripple, you can trust that your hardware and systems are in expert hands, ensuring continued success for your business.',
    'icon': Icons.settings,
  },
  {
    'title': 'Hardware Manufacturing',
    'description':
        'At Quantum Ripple, we are driven by a vision to not only supply high-quality computer hardware and accessories but also to lead the way in manufacturing innovative, '
        'complex devices that address some of Africa''s most pressing societal challenges. '
        'Our aim is to develop cutting-edge technology that improves lives, enhances productivity, and fosters sustainable development across the continent. '
        'From solving connectivity issues to advancing healthcare solutions, we are committed to creating devices that make a real difference. '
        'As we expand into manufacturing, we look forward to providing impactful, high-quality solutions that will drive progress and shape a brighter future for Africa.'
            'Visit our innovation lab for more information on the software systems we are building',
    'icon': Icons.precision_manufacturing,
  },


  {
    'title': 'Research',
    'description':
        'At Quantum Ripple, we are committed to pushing the boundaries of innovation through dedicated research in cutting-edge fields such as '
        'Artificial Intelligence (AI), Robotics, and the development of high-quality devices that can make a significant impact. '
        'Our research initiatives are focused on creating solutions that solve real-world problems, from enhancing automation in industries to advancing smart technologies for everyday life.'
        ' By investing in AI and robotics, we aim to drive transformative change, offering products that not only meet the highest standards of quality but also contribute to shaping the future. '
        'As we continue our journey into research and development, we strive to make a lasting difference in society, creating technologies that empower businesses and improve lives across Africa and beyond.'
        'Visit our innovation lab for more information on the software systems we are building',
    'icon': Icons.laptop_chromebook_sharp,
  },


  {
    'title': 'Software Development',
    'description':
        'At Quantum Ripple, we are building a strong foundation in software development, driven by a team of talented programmers and solutionists '
        'who are dedicated to creating innovative systems that tackle real-world challenges. Our focus is on developing intelligent, '
        'user-centric software solutions that streamline processes, improve efficiency, and solve complex problems across various industries.'
        ' From custom applications to scalable enterprise solutions, we pride ourselves on delivering cutting-edge technologies that empower businesses and individuals alike.'
        ' Our team is constantly pushing the boundaries of innovation, ensuring that every system we create is not just functional, but a true problem-solver that makes a meaningful impact.'
            'Visit our innovation lab for more information on the software systems we are building',
    'icon': Icons.computer,
  },


  {
    'title': 'Consultation',
    'description':
    'At Quantum Ripple, our consultation services are designed to help you navigate the complexities of technology with confidence.'
  ' Whether you need advice on selecting the right hardware, developing custom software solutions, or optimizing your existing systems,'
  ' our expert consultants are here to guide you every step of the way. With deep industry knowledge and a keen understanding of your unique needs,'
  ' we provide tailored solutions that align with your goals. Our team of professionals works closely with you to ensure that your technology investments deliver maximum value,'
  ' enhance operational efficiency, and solve your most pressing challenges. Let us be your trusted partner in technology, and together, we will create a roadmap to your success.',
    'icon': Icons.support_agent,
  },
  {
    'title': 'Customization',
    'description':
    'At Quantum Ripple, we understand that one size doesn’t fit all. That’s why we offer bespoke customization services tailored to meet your specific needs.'
  ' Whether it is creating custom hardware configurations, developing personalized software solutions, or modifying existing systems, '
        'our team of experts works closely with you to deliver technology that perfectly aligns with your business or personal requirements. '
        'Our commitment to quality and precision ensures that every custom solution we provide is not only innovative but also built to perform at the highest standards. '
        'Let us help you bring your unique vision to life with fully customized products and services designed to elevate your technology experience.',
    'icon': Icons.design_services,
  },
];




