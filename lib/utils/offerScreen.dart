import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OffersScreen extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {
      "title": "Get 20% Off on First Service",
      "code": "WELCOME20",
      "description": "Applicable on your first booking. Max discount ₹100.",
      "validity": "Valid till 31st March 2025",
    },
    {
      "title": "₹50 Cashback on Repairs",
      "code": "CASH50",
      "description": "Get ₹50 cashback when you book any repair service.",
      "validity": "Valid till 15th April 2025",
    },
    {
      "title": "Flat ₹100 Off on AC Repair",
      "code": "AC100",
      "description": "Use this coupon for a ₹100 discount on AC repair.",
      "validity": "Valid till 10th May 2025",
    },
    {
      "title": "Refer & Earn ₹200",
      "code": "REFER200",
      "description": "Invite your friends & get ₹200 when they book a service.",
      "validity": "No expiry",
    },
  ];

  OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: (Theme.of(context).brightness == Brightness.dark)
            ? AppColors.textPrimary
            : AppColors.electricBlue,
        title: Text("FixitBhaii Offer Zone",
            style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return _buildOfferCard(context, offers[index]);
        },
      ),
    );
  }

  // 🔹 Offer Card Widget
  Widget _buildOfferCard(BuildContext context, Map<String, String> offer) {
    return Card(
      color: (Theme.of(context).brightness == Brightness.dark)
          ? const Color.fromARGB(125, 4, 140, 237)
          : AppColors.electricBlue,
      margin: EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              offer["title"]!,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              offer["description"]!,
              style: TextStyle(color: Colors.white70, fontSize: 14),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    offer["code"]!,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  offer["validity"]!,
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // Copy Coupon Code
                },
                child: Text("Copy Code",
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
