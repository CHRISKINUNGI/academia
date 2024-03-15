import 'package:academia/exports/barrel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'repairs_controller.dart';

class RepairsPage extends StatelessWidget {
  final RepairsController homeController = Get.put(RepairsController());

  RepairsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.laptop,
              size: 30.0,
            ),
            SizedBox(width: 30.0),
            Text(
              'Laptop Repair Services',
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ServiceCard(
                      title: 'Screen Repair',
                      description: 'Cracked or malfunctioning screen? We\'ve'
                          ' got you covered with quick and affordable screen repairs.',
                      imagetag:
                          '/home/eightex/flutter_project/repairs_app/assets/images/screen.jpg',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ServiceCard(
                      imagetag:
                          '/home/eightex/flutter_project/repairs_app/assets/images/image1.jpg',
                      title: 'Hardware Replacement',
                      description:
                          'From batteries to keyboards, we can replace faulty'
                          'hardware components to get your laptop running smoothly again.',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ServiceCard(
                      imagetag:
                          '/home/eightex/flutter_project/repairs_app/assets/images/doc.jpeg',
                      title: 'Software Troubleshooting',
                      description:
                          'Is your laptop acting up? Our experts can diagnose'
                          ' and fix software issues to optimize performance.',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagetag;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagetag,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                imagetag,
                height: 100.0,
                width: 100.0,
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(description),
          ],
        ),
      ),
    );
  }
}
