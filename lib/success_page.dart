import 'package:flutter/material.dart';

class SuccessStoriesPage extends StatelessWidget {
  // Hardcoded list of success stories
  final List<SuccessStory> stories = [
    SuccessStory(
      companyName: 'TechCorp Solutions',
      description:
      'Quantum Ripple exceeded our expectations in every way! As a fast-growing tech solutions provider, '
          'we needed high-performance computers and laptops to support our operations. Quantum Ripple not only provided '
          'top-tier devices but also ensured the delivery was seamless and ahead of schedule.'
          'The quality of the hardware is exceptional — our team has seen a significant boost in productivity since the upgrade.'
          ' What stood out the most was their customer service; they took the time to understand our unique needs and offered tailored solutions.'
          'We wholeheartedly recommend Quantum Ripple to any business looking for quality products and reliable service. '
          'They are not just a supplier; they are a partner in success.\n\n_James Miller, Operations Manager, TechCorp Enterprises ',
      imageUrl: 'assets/images/techcorp.png', // Replace with actual image path
      recommendation: '',
      isHardware: true,
    ),


    SuccessStory(
      companyName: 'NextGen Startups',
      description:
      'Partnering with Quantum Ripple was one of the best decisions we’ve made for our business. '
          'They not only designed a stunning and user-friendly website for us but also built robust internal systems tailored '
          'to streamline our employee workflows.Their attention to detail and commitment to delivering excellence were evident'
          ' in every phase of the project. The website has significantly boosted our online presence, while the internal systems have transformed '
          'how we manage operations, saving us countless hours each week.Quantum Ripple''s team is professional, innovative, and always ready to go the extra mile. '
          'For any startup looking to scale with the right technology partner, Quantum Ripple is the way to go!\n\n_Sophia Tran, CEO, NextGen Startups',
      imageUrl: 'assets/images/nextgen.png', // Replace with actual image path
      recommendation: '',
      isHardware: false,
    ),
    SuccessStory(
      companyName: 'GreenField HighSchool',
      description:
      '"We are incredibly grateful to Quantum Ripple for their outstanding work in setting up our school’s computer laboratory.'
          ' The project was executed with professionalism and precision, ensuring that every system was configured to meet the educational '
          'needs of our students.The quality of the equipment provided and the efficiency of the installation exceeded our expectations.'
          ' Quantum Ripple also took the time to train our staff, ensuring they could maximize the use of the new systems.Thanks to their expertise, '
          'our students now have access to a state-of-the-art computer lab that has revolutionized their learning experience. We wholeheartedly '
          'recommend Quantum Ripple to any institution looking for reliable and top-notch tech solutions."\n\n_Mr. Daniel Omondi, Principal, Greenfield High School',
      imageUrl: 'assets/images/edutech.png', // Replace with actual image path
      recommendation: '',
      isHardware: true,
    ),
    SuccessStory(
      companyName: 'Bright Future Academy',
      description:
      'Quantum Ripple has been an invaluable partner in our journey to modernize and maintain our systems.'
          ' From customizing our technology to fit our unique academic needs to providing ongoing maintenance, their team has'
          ' consistently delivered exceptional service.The tailored systems they implemented have improved our administrative efficiency, '
          'streamlined our operations, and enhanced the learning environment for our students. Their proactive maintenance ensures that '
          'everything runs smoothly, allowing us to focus on what matters most—education.Quantum Ripple is more than a service provider; '
          'they are a trusted partner in our success. We highly recommend them to any organization seeking reliable and innovative tech solutions.\n\n_Sarah Wanjiru, Director, Bright Future Academy',
      imageUrl: 'assets/images/futurelabs.png', // Replace with actual image path
      recommendation: '',
      isHardware: true,
    ),
    SuccessStory(
      companyName: 'Jamii SuperMarket',
      description:
      '"Quantum Ripple transformed our supermarket operations with their exceptional tech solutions.'
          ' They provided us with customized point-of-sale systems, inventory management software, and hardware '
          'that streamlined every aspect of our business.Their team worked closely with us to understand our unique challenges,'
          ' delivering a solution that increased efficiency, reduced errors, and improved customer satisfaction. The transition was seamless, '
          'and their ongoing support ensures that everything runs smoothly.Thanks to Quantum Ripple, we’ve modernized our operations and set a new standard '
          'for excellence in retail management. We highly recommend them to any business looking to optimize t'
          'heir processes with cutting-edge technology.\n\n_Josephine Mwangi, Operations Manager, Jamii SuperMarket',

      imageUrl: 'assets/images/futurelabs.png', // Replace with actual image path
      recommendation: 'A fantastic choice for reliable tech solutions!',
      isHardware: true,
    ),
    SuccessStory(
      companyName: 'GreenLine Architects',
      description:
      'Quantum Ripple played a key role in bringing our vision to life by creating an exceptional website portfolio'
          ' for Greenline Architects. They took the time to understand our brand and the unique nature of our work,'
          ' delivering a site that perfectly showcases our projects in a professional and visually appealing way.'
          'The design is sleek, modern, and user-friendly, making it easy for potential clients to explore our projects and services. '
          'Quantum Ripple’s team was responsive, creative, and highly efficient throughout the entire process.'
          'Thanks to their expertise, we now have a portfolio that not only highlights our capabilities but also strengthens our online presence.'
          ' We wholeheartedly recommend Quantum Ripple to any company looking for high-quality web design and development'
          ' services.\n\n_David Munyao, Principal Architect, Greenline Architects.',
      imageUrl: 'assets/images/greenline.png', // Replace with actual image path
      recommendation: 'Highly recommend their creative web design services!',
      isHardware: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/nett.jpeg', // Replace with your background image path
              fit: BoxFit.cover,
            ),
          ),

          // Content with a translucent overlay
          Container(
            color: Colors.black.withOpacity(0.6), // Adds a translucent overlay for readability
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                return SuccessStoryCard(story: story);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Success Story model
class SuccessStory {
  final String companyName;
  final String description;
  final String imageUrl;
  final String recommendation;
  final bool isHardware;

  SuccessStory({
    required this.companyName,
    required this.description,
    required this.imageUrl,
    required this.recommendation,
    required this.isHardware,
  });
}

// Success Story card widget
class SuccessStoryCard extends StatelessWidget {
  final SuccessStory story;

  const SuccessStoryCard({Key? key, required this.story}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 4, // Keeps the shadow effect; reduce to 0 for a flat look
      color: Colors.black, // Makes the card background black
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(story.imageUrl),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Text(
                    story.companyName,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Ensures readability on a black background
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              story.description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white, // Ensures text is readable
              ),
            ),
            SizedBox(height: 8),
            Text(
              '"${story.recommendation}"',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.black , // Subtle text color
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Chip(
                label: Text(
                  story.isHardware ? 'Hardware' : 'Software',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: story.isHardware ? Colors.blue : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );

  }
}
