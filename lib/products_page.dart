import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final List<ProductCategory> categories = [
    ProductCategory(
      title: 'Apple Computers',
      description:
      '',
      details: '',
      products: [
        Product(
          name: 'Mac Studio (2022)',
          imageUrl: 'assets/images/apple/mac22.jpeg',
          details: 'Processor: Up to Apple M1 Max chip\nDisplay: None (requires external monitor)\nStorage: Up to 8 TB SSD\nRAM: Up to 64 GB\nGraphics: Up to 32-core GPU'),
        Product(
          name: 'iMac (24-inch, M1, 2021)',
          imageUrl: 'assets/images/apple/mac21.jpeg',
          details: 'Processor: Apple M1 chip\nDisplay: 24-inch Retina 4.5K display\nStorage: 256 GB SSD\nRAM: 8 GB\nGraphics: 7-core GPU',
        ),
        Product(
            name: 'Mac Mini (M1, 2020)',
            imageUrl: 'assets/images/apple/mac20.jpeg',
            details: 'Processor: Apple M1 chip\nDisplay: None (requires external monitor)\nStorage: 256 GB SSD\nRAM: 8 GB\nGraphics: 7-core GPU' ),
        Product(
            name: 'iMac (Retina 5K, 27-inch, Late 2019)',
            imageUrl: 'assets/images/apple/mac19.jpeg',
            details: 'Processor: Up to 3.6 GHz Intel Core i9 (9900K)\nDisplay: 27-inch Retina 5K display\nStorage: Up to 2 TB SSD\nRAM: Up to 64 GB\nGraphics: AMD Radeon Pro 5700 XT'),
        Product(
            name: 'Mac Mini (Late 2018)',
            imageUrl: 'assets/images/apple/mac18.jpeg',
            details: 'Processor: 3.6 GHz Intel Core i3 (8350U)\nDisplay: None (requires external monitor)\nStorage: 128 GB SSD\nRAM: 8 GB\nGraphics: Intel UHD Graphics 617' ),
        Product(
            name: 'iMac (Retina 4K, 21.5-inch, Late 2017)',
            imageUrl: 'assets/images/apple/mac17.png',
            details: 'Processor: 3.4 GHz Intel Core i5 (Kaby Lake)\nDisplay: 21.5-inch Retina 4K display\nStorage: 1 TB Fusion Drive\nRAM: 8 GB\nGraphics: Intel UHD Graphics 630 '),

        Product(
          name: 'iMac (Retina 5K, 27-inch, Late 2015)',
          imageUrl: 'assets/images/apple/mac15.jpg',
          details: 'Processor: Up to 4.0 GHz Intel Core i7 (6700K)\nDisplay: 27-inch Retina 5K display\nStorage: Up to 2 TB Fusion Drive\nRAM: Up to 32 GB\nGraphics: AMD Radeon R9 M395X'),
  ],
  ),//apple computers

    ProductCategory(
      title: 'HP Computers',
      description:
      '',
      details: '',
      products: [
        Product(
          name: 'HP Envy Move 23.8" All-in-One',
          imageUrl: 'assets/images/hp/envy.jpeg',
          details: 'Display: 23.8" QHD Touchscreen\nProcessor: Intel Core i5-1355U\nRAM: 16GB LPDDR5\nStorage: 1TB SSD\nSpecial Features: Rechargeable Battery, Integrated Bluetooth Keyboard, Kickstand Feet, Privacy Camera',
        ),
        Product(
          name: 'HP Envy 24 All-in-One',
          imageUrl: 'assets/images/hp/envy.jpeg',
          details: 'Display: 23.8" Full HD Touchscreen\nProcessor: Intel Core i7\nRAM: 8GB DDR3\nStorage: 1TB HDD\nSpecial Features: 10-Point Touch, Integrated Webcam, Wireless Keyboard and Mouse',
        ),
        Product(
          name: 'HP Pavilion TP01-3055xt',
          imageUrl: 'assets/images/hp/pavillion.jpeg',
          details: 'Display: 27" Full HD Touchscreen\nProcessor: Intel Core i7\nRAM: 16GB DDR4\nStorage: 512GB SSD\nSpecial Features: Built-in Speakers, Webcam, Wireless Keyboard',
        ),
        Product(
          name: 'HP Z2 Tower G9 Workstation',
          imageUrl: 'assets/images/hp/tower.jpeg',
          details: 'Processor: Intel Core i9\nRAM: 32GB DDR4\nStorage: 2TB SSD\nSpecial Features: High Performance Graphics, Multiple Expansion Slots',
        ),
        Product(
          name: 'HP Elite Mini 800 G9',
          imageUrl: 'assets/images/hp/elite.jpeg',
          details: 'DDisplay: 23.8" Full HD Touchscreen\nProcessor: Intel Core i5\nRAM: 8GB DDR4\nStorage: 256GB SSD\nSpecial Features: Business-oriented Features, Secure Boot, TPM 2.0',
        ),
        Product(
          name: 'HP Victus by HP 15L Gaming Desktopt',
          imageUrl: 'assets/images/hp/victus.jpeg',
          details: 'Processor: Intel Core i7\nRAM: 16GB DDR4\nStorage: 1TB SSD\nSpecial Features: Gaming Graphics Card, RGB Lighting',
        ),
      ],
    ),//hp computers
    ProductCategory(
      title: 'Dell Computers',
      description:
      '',
      details: '',
      products: [
        Product(
          name: 'Dell OptiPlex 7090',
          imageUrl: 'assets/images/del2/7090.jpeg',
          details: 'Processor: Intel Core i7-11700K\nRAM: 32GB DDR4\nStorage: 1TB SSD\nSpecial Features: High performance, expandable, suitable for office use',
        ),
        Product(
          name: 'Dell XPS Desktop (2023)',
          imageUrl: 'assets/images/del2/xps23.jpeg',
          details: 'Processor: Intel Core i9-12900K\nRAM: 32GB DDR5\nStorage: 2TB SSD\nSpecial Features: Powerful performance, sleek design, great for gaming and multimedia',
        ),
        Product(
          name: 'Dell Inspiron Desktop (2023)',
          imageUrl: 'assets/images/del2/insp23.jpeg',
          details: 'Processor: Intel Core i5-11400F\nRAM: 16GB DDR4\nStorage: 512GB SSD\nSpecial Features: Affordable, good for home use, easy to upgrade',
        ),
        Product(
          name: 'Dell OptiPlex 7020',
          imageUrl: 'assets/images/del2/7020.jpeg',
          details: 'Processor: Intel Core i7-14700T\nRAM: 32GB DDR4\nStorage: 1TB SSD\nSpecial Features: Energy-efficient ultracompact PC, customizable specs',
        ),
        Product(
          name: 'Dell OptiPlex 7420',
          imageUrl: 'assets/images/del2/7420.jpeg',
          details: 'Processor: Intel Core i7-14700\nRAM: 32GB DDR5\nStorage: 2TB SSD\nSpecial Features: High performance, multiple expansion slots, business-oriented',
        ),
        Product(
          name: 'Dell Inspiron Small Desktop 3030',
          imageUrl: 'assets/images/del2/3030.jpeg',
          details: 'Processor: Intel Core i7-14700\nRAM: 16GB DDR4\nStorage: 1TB SSD\nSpecial Features: Supports up to 3 FHD monitors, built-in security with hardware TPM'
        ),
      ],
    ),//dell computers


    ProductCategory(
      title: 'HP Laptops',
      description:
      '',
      details: '',
      products: [
        Product(
          name: 'HP Envy 17',
          imageUrl: 'assets/images/hpl/hp17.jpeg',
          details: 'Display: 17.3" Full HD\nProcessor: Intel Core i7-12700H\nRAM: 16GB LPDDR5\nStorage: 1TB SSD\nSpecial Features: Powerful performance, sleek design, great for multimedia',
        ),
        Product(
          name: 'HP Envy x360',
          imageUrl: 'assets/images/hpl/hp360.jpeg',
          details: 'Display: 15.6" Full HD Touchscreen\nProcessor: Intel Core i5\nRAM: 8GB DDR3\nStorage: 512GB SSD\nSpecial Features: 2-in-1 Convertible, Integrated Graphics, Fingerprint Reader'
        ),
        Product(
          name: 'HP Pavillion Plus',
          imageUrl: 'assets/images/hpl/hppavv.jpeg',
          details: 'Display: 14" Full HD Touchscreen\nProcessor: Intel Core i5\nRAM: 8GB DDR4\nStorage: 256GB SSD\nSpecial Features: Budget-friendly, good performance for everyday tasks'
        ),
        Product(
          name: 'HP Spectre x360',
          imageUrl: 'assets/images/hpl/hp360.jpeg',
          details: 'Display: 13.3" 4K Touchscreen\nProcessor: Intel Core i7\nRAM: 16GB LPDDR4\nStorage: 512GB SSD\nSpecial Features: 2-in-1 Convertible, Integrated Graphics, Fingerprint Reader'
        ),
        Product(
          name: 'HP Omen15',
          imageUrl: 'assets/images/hpl/omen.jpeg',
          details: 'Display: 15.6" Full HD\nProcessor: Intel Core i7\nRAM: 16GB DDR4\nStorage: 1TB SSD\nSpecial Features: High-end gaming graphics, customizable RGB lighting'
        ),
        Product(
          name: 'HP ChromeBook14',
          imageUrl: 'assets/images/hpl/chrome.jpeg',
          details: 'Display: 14" HD\nProcessor: Intel Celeron\nRAM: 4GB DDR4\nStorage: 32GB eMMC\nSpecial Features: Chrome OS, lightweight, long battery life'
        ),
        Product(
          name: 'HP EliteBook 840 G7',
          imageUrl: 'assets/images/hpl/elitebook.jpeg',
          details: 'Display: 14" Full HD\nProcessor: Intel Core i7\nRAM: 16GB DDR4\nStorage: 512GB SSD\nSpecial Features: Business-oriented, durable design, secure boot'
        ),
      ],
    ),//hp laptops

    ProductCategory(
      title: 'Dell Laptops',
      description:
      '',
      details: '',
      products: [
        Product(
          name: 'Dell Latitude 9440 2-in-1 (2024)',
          imageUrl: 'assets/images/del/latitude.jpeg',
          details: 'Processor: Up to Intel Core i7-13700H\nDisplay: 14-inch FHD displayStorage: Up to 1TB SSD\nRAM: Up to 32GB\nBattery Life: Up to 12 hours',
        ),
        Product(
          name: 'Alienware m16 R2 (2024)',
          imageUrl: 'assets/images/del/alien.jpeg',
          details: 'Processor: Up to Intel Core i9-13900H\nDisplay: 16-inch QHD display\nStorage: Up to 2TB SSD\nRAM: Up to 64GB\nraphics: NVIDIA GeForce RTX 4070\nBattery Life: Up to 6 hours',
        ),
        Product(
          name: 'Dell G15(2024)',
          imageUrl: 'assets/images/del/g15.jpeg',
          details: 'Processor: Up to Intel Core i7-13700H\nDisplay: 15.6-inch FHD display\nStorage: Up to 1TB SSD\nRAM: Up to 32GB\nGraphics: NVIDIA GeForce RTX 3060\nBattery Life: Up to 8 hours',
        ),
        Product(
          name: 'Dell Inspiron 15 (2024)',
          imageUrl: 'assets/images/del/insp15.jpeg',
          details: 'Processor: Up to Intel Core i5-13400H\nDisplay: 15.6-inch FHD display\nStorage: Up to 512GB SSD\nRAM: Up to 16GB\nBattery Life: Up to 10 hours',
        ),
        Product(
          name: 'Dell Inspiron 16 2-in-1 (2024)',
          imageUrl: 'assets/images/del/ins16.jpeg',
          details: 'Processor: Up to Intel Core i7-13700H\nDisplay: 16-inch FHD+ display\nStorage: Up to 1TB SSD\nRAM: Up to 32GB\nBattery Life: Up to 10 hours',
        ),
        Product(
          name: 'Dell XPS 13 (2024, Snapdragon)',
          imageUrl: 'assets/images/del/xps13.jpeg',
          details: 'Processor: Snapdragon X Elite chip\nDisplay: 13.4-inch FHD+ InfinityEdge display\nStorage: Up to 1TB SSD\nRAM: Up to 16GB\nBattery Life: Up to 12 hours',
        ),
        Product(
          name: 'Dell XPS 16 (2024)',
          imageUrl: 'assets/images/del/xps16.jpeg',
          details: 'Processor: Up to Intel Core i7-13700H\nDisplay: 16-inch UHD+ InfinityEdge display\nStorage: Up to 2TB SSD\nRAM: Up to 64GB\nBattery Life: Up to 10 hours',
        ),
      ],
    ),//dell laptops

    ProductCategory(
      title: 'MacBooks',
      description:
      '',
      details: '',
      products: [
        Product(
          name: 'MacBook Air (13-inch, M3)',
          imageUrl: 'assets/images/mac/macbook24.png',
          details: 'Processor: M3 chip\nDisplay: 13.6-inch Liquid Retina display\nStorage: Up to 2TB SSD\nRAM: Up to 24GB\nGraphics: Integrated GPU\nBattery Life: Up to 18 hours',
        ),
        Product(
          name: 'MacBook Pro (14-inch, M2 Pro/Max)',
          imageUrl: 'assets/images/mac/macbook23.png',
          details: 'Processor: M2 Pro or M2 Max chip\nDisplay: 14.2-inch Liquid Retina XDR display\nStorage: Up to 8TB SSD\nRAM: Up to 64GB\nGraphics: Integrated GPU\nBattery Life: Up to 17 hours',

        ),
        Product(
          name: 'MacBook Pro (13-inch, M2)',
          imageUrl: 'assets/images/mac/macbook22.png',
          details: 'Processor: M2 chip\nDisplay: 13.3-inch Liquid Retina XDR display\nStorage: Up to 2TB SSD\nRAM: Up to 24GB\nGraphics: Integrated GPU\nBattery Life: Up to 20 hours',
        ),
        Product(
          name: 'MacBook Pro (14-inch & 16-inch, M1)',
          imageUrl: 'assets/images/mac/macbook21.png',
          details: 'Processor: M1 Pro or M1 Max chip\nDisplay: 14.2-inch & 16.2-inch Liquid Retina XDR display\nStorage: Up to 8TB SSD\nRAM: Up to 64GB\nGraphics: Integrated GPU\nBattery Life: Up to 20 hours',
        ),
        Product(
          name: 'MacBook Air(M1)',
          imageUrl: 'assets/images/mac/macbook20.jpg',
          details: 'Processor: M1 chip\nDisplay: 13.6-inch Liquid Retina display\nStorage: Up to 2TB SSD\nRAM: Up to 16GB\nGraphics: Integrated GPU\nBattery Life: Up to 18 hours',
        ),
        Product(
          name: 'MacBook Pro (16-inch, 2019)',
          imageUrl: 'assets/images/mac/macbook19.jpg',
          details: 'Processor: Up to 8-core Intel Core i9\nDisplay: 16-inch Retina display with True Tone\nStorage: Up to 8TB SSD\nRAM: Up to 64GB\nGraphics: AMD Radeon Pro 5500M\nBattery Life: Up to 11 hours',
        ),
        Product(
          name: 'MacBook Pro (13-inch, 2018)',
          imageUrl: 'assets/images/mac/macbook18.jpg',
          details: 'Processor: Up to 2.7 GHz quad-core Intel Core i7 (Turbo Boost up to 4.5 GHz)\nDisplay: 13.3-inch Retina display with True Tone\nStorage: Up to 2TB SSD\nRAM: Up to 16GB\nGraphics: Intel Iris Plus Graphics 655\nBattery Life: Up to 10 hours',
        ),
        Product(
          name: 'MacBook Pro (13-inch, 2017)',
          imageUrl: 'assets/images/mac/macbook17.jpg',
          details: 'Processor: Up to 3.5 GHz dual-core Intel Core i7 (Turbo Boost up to 4.0 GHz)\nDisplay: 13.3-inch Retina display\nStorage: Up to 1TB SSD\nRAM: Up to 16GB\nGraphics: Intel Iris Plus Graphics 650\nBattery Life: Up to 10 hours',
        ),
      ],

    ),//mac books
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black, // Set background color to black
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return CategorySection(category: category);
            },
          ),
        ),
      ),
    );
  }
}

class ProductCategory {
  final String title;
  final String description;
  final String details;
  final List<Product> products;

  ProductCategory({
    required this.title,
    required this.description,
    required this.details,
    required this.products,
  });
}

class Product {
  final String name;
  final String imageUrl;
  final String? details;  // Make details optional

  Product({required this.name, required this.imageUrl, this.details});
}

class CategorySection extends StatelessWidget {
  final ProductCategory category;

  const CategorySection({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category.title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green, // Set text color to white
          ),
        ),
        SizedBox(height: 8),
        Text(
          category.description,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white70, // Set description text to white with transparency
          ),
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.products.length,
            itemBuilder: (context, index) {
              final product = category.products[index];
              return ProductCard(product: product);
            },
          ),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (product.details != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(product.name),
                content: Text(product.details ?? 'No details available'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        width: 150,
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              product.name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set text color to white
              ),
            ),
          ],
        ),
      ),
    );
  }
}