import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:fixitbhai/utils/themes/app.dimensions.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class RefurbishedCarousel extends StatelessWidget {
  final List<Map<String, dynamic>> refurbishedItems = [
    {
      "image": "assets/images/r1.jpg",
      "name": "Refurbished Laptop",
      "price": "₹25,000",
      "condition": "Like New",
      "warranty": "6 Months",
      "rating": 4.5,
    },
    {
      "image": "assets/images/r2.jpg",
      "name": "Smart LED TV",
      "price": "₹12,000",
      "condition": "Slightly Used",
      "warranty": "3 Months",
      "rating": 4.2,
    },
    {
      "image": "assets/images/r3.jpg",
      "name": "Mixer Grinder",
      "price": "₹2,500",
      "condition": "Like New",
      "warranty": "6 Months",
      "rating": 4.8,
    },
    {
      "image": "assets/images/r4.jpeg",
      "name": "Air Purifier",
      "price": "₹5,000",
      "condition": "Moderately Used",
      "warranty": "3 Months",
      "rating": 4.0,
    },
    {
      "image": "assets/images/r5.jpg",
      "name": "Refurbished Monitor",
      "price": "₹7,500",
      "condition": "Like New",
      "warranty": "6 Months",
      "rating": 4.6,
    },
  ];

  RefurbishedCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 0.6,
        enlargeFactor: 0.5,
        height: 240.0,
        autoPlay: true,
        enlargeCenterPage: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
      ),
      items: refurbishedItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () {
                AutoRouter.of(context).push(RefurbishedItemRoute(item: item));
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)
                          .withValues(alpha: 0.1)),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.5),
                      offset: const Offset(0, 4),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Stack(
                    children: [
                      // Background Image
                      ColorFiltered(
                        colorFilter: ColorFilter.matrix([
                          1.2, 0, 0, 0, 0, // Increase Red
                          0, 1.2, 0, 0, 0, // Increase Green
                          0, 0, 1.2, 0, 0, // Increase Blue
                          0, 0, 0, 1, 0, // Alpha
                        ]),
                        child: Image.asset(
                          item["image"]!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      // Gradient Overlay
                      Positioned.fill(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Color.fromARGB(200, 0, 0, 0),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ),
                      // Bottom Item Details
                      Positioned(
                        bottom: 10,
                        left: 10,
                        right: 10,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  item["name"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Text(
                              "Lapcare technologies, Chinhat, Lucknow",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  item["price"]!,
                                  style: const TextStyle(
                                    color: Colors.amber,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                Spacer(),
                                Icon(Icons.verified,
                                    color: Colors.green, size: 16),
                                Text(
                                  " ${item["warranty"]} Warranty",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // "Refurbished" Badge with Condition Indicator
                      Positioned(
                        top: 10,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: _getConditionColor(item["condition"]!),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            item["condition"]!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // "View Details" Button
                      // Positioned(
                      //   bottom: 10,
                      //   right: 10,
                      //   child: ElevatedButton(
                      //     style: ElevatedButton.styleFrom(
                      //       backgroundColor: Colors.redAccent,
                      //       padding:
                      //           EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //       ),
                      //     ),
                      //     onPressed: () {
                      //       // Handle item details navigation
                      //     },
                      //     child: const Text(
                      //       "View Details",
                      //       style: TextStyle(fontSize: 14, color: Colors.white),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  // Function to get color based on item condition
  Color _getConditionColor(String condition) {
    switch (condition) {
      case "Like New":
        return const Color.fromARGB(255, 14, 199, 20);
      case "Slightly Used":
        return const Color.fromARGB(255, 255, 73, 1);
      case "Moderately Used":
        return Colors.redAccent;
      default:
        return const Color.fromARGB(255, 4, 144, 214);
    }
  }
}
