// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart';
import 'package:flutter/material.dart';

Widget buildVendorCard(BuildContext context, String discount, String title,
    String time, String distance, String imagePath) {
  return Container(
    margin: EdgeInsets.all(6),
    height: 100,
    width: 150, // Adjust width as needed
    decoration: BoxDecoration(
        border: Border.all(
            color: (Theme.of(context).brightness == Brightness.dark)
                ? const Color.fromARGB(255, 75, 73, 73).withValues(alpha: 0.1)
                : Colors.black12),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 8, 8, 8)
                .withOpacity(0.3), // Shadow color
            offset: Offset(0, 4), // Horizontal and vertical shadow position
            blurRadius: 8, // Blurriness of the shadow
            spreadRadius: 2, // How far the shadow spreads
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context)
            .cardTheme
            .color // Slightly lighter background for the card
        ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: ColorFiltered(
                colorFilter: ColorFilter.matrix([
                  1.2, 0, 0, 0, 0, // Increase Red
                  0, 1.2, 0, 0, 0, // Increase Green
                  0, 0, 1.2, 0, 0, // Increase Blue
                  0, 0, 0, 1, 0, // Alpha
                ]),
                child: Image.asset(
                  imagePath,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              // left: 4,
              child: Container(
                height: 45,
                width: 500,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Color.fromARGB(77, 0, 0, 0),
                    Color.fromARGB(210, 0, 0, 0),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    discount,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    "up to 80",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 3),
              Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      // color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 3),
              Row(
                children: [
                  Icon(Icons.location_on_rounded, color: Colors.red, size: 16),
                  SizedBox(width: 4),
                  Text(
                    // ignore: prefer_interpolation_to_compose_strings
                    time + " • " + distance,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.white70
                            : const Color.fromARGB(255, 74, 74, 74),
                        fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class FoodCard1 extends StatelessWidget {
  final String imagePath;
  final String title;
  final Function() onTap;

  const FoodCard1({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 90,
            height: 80,

            // shape: BoxShape.circle, // Makes the image circular

            child: ColorFiltered(
              colorFilter: ColorFilter.matrix([
                1.2, 0, 0, 0, 0, // Increase Red
                0, 1.2, 0, 0, 0, // Increase Green
                0, 0, 1.2, 0, 0, // Increase Blue
                0, 0, 0, 1, 0, // Alpha
              ]),
              child: Image.asset(
                imagePath,
                height: 120,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        SizedBox(height: 4), // Spacing between image and text
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                // Text color
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class VendorCard extends StatelessWidget {
  const VendorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(VendorRoute());
      },
      child: Container(
        width: 300, // Adjust width as per requirement
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 104, 102, 102)
                  .withValues(alpha: 0.3)),
          color: Theme.of(context).cardTheme.color, // Background color
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 8, 8, 8)
                  .withOpacity(0.3), // Shadow color
              offset: Offset(0, 4), // Horizontal and vertical shadow position
              blurRadius: 8, // Blurriness of the shadow
              spreadRadius: 2, // How far the shadow spreads
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                  child: ColorFiltered(
                    colorFilter: ColorFilter.matrix([
                      1.2, 0, 0, 0, 0, // Increase Red
                      0, 1.2, 0, 0, 0, // Increase Green
                      0, 0, 1.2, 0, 0, // Increase Blue
                      0, 0, 0, 1, 0, // Alpha
                    ]),
                    child: Image.asset(
                      'assets/images/nn.jpeg',
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(
                    Icons.visibility_off,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.store_mall_directory,
                          color: Colors.green, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "OPEN NOW",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.location_on, color: Colors.green, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "4.4 km ",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text(
                    "The American Pizza",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Repair · Replace · Pickup Available",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: (Theme.of(context).brightness == Brightness.dark)
                            ? Colors.grey
                            : const Color.fromARGB(255, 92, 92, 92),
                        fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "3.8 ★",
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.flash_on, color: Colors.blue, size: 14),
                      SizedBox(width: 4),
                      Text(
                        "Free Home Visit",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String time;
  final String distance;
  final String description;
  final double rating;
  final String price;

  const FoodCard({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.time,
    required this.distance,
    required this.description,
    required this.rating,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Time and Distance Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.timer, size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Row(
                  children: [
                    const Icon(Icons.location_on,
                        size: 14, color: Colors.green),
                    const SizedBox(width: 4),
                    Text(
                      distance,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Title and Description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Rating and Offer
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, size: 14, color: Colors.white),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Flash Sale: FLA% OFF',
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
