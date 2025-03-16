// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ServiceDisplayScreen extends StatelessWidget {
  final String serviceName;
  final String serviceImage;
  final String description;
  final String duration;
  final double price;
  final List<Map<String, String>> faqs; // Updated FAQ structure
  final List<String> diyTips;
  final List<String> uniqueFeatures;
  final List<Map<String, dynamic>> vendors; // Vendor details

  ServiceDisplayScreen({
    Key? key,
    required this.serviceName,
    required this.serviceImage,
    required this.description,
    required this.duration,
    required this.price,
    required this.faqs,
    required this.diyTips,
    required this.uniqueFeatures,
    required this.vendors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            floating: false,
            pinned: true,
            backgroundColor: (Theme.of(context).brightness == Brightness.dark)
                ? AppColors.textPrimary
                : AppColors.electricBlue,
            iconTheme: IconThemeData(color: Colors.white), // Change color here
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.symmetric(vertical: 10, horizontal: 52),
              title: Text(serviceName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    serviceImage,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          const Color.fromARGB(49, 0, 0, 0).withOpacity(0.1),
                          const Color.fromARGB(98, 0, 0, 0).withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Service Details
                    _buildSectionTitle("Service Details"),
                    SizedBox(height: 8),
                    Text(description,
                        style: TextStyle(
                            color: (Theme.of(context).brightness ==
                                    Brightness.dark)
                                ? Colors.white70
                                : Colors.black)),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.blueAccent),
                        SizedBox(width: 5),
                        Text("Duration: $duration",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: (Theme.of(context).brightness ==
                                        Brightness.dark)
                                    ? Colors.white
                                    : Colors.black)),
                        Spacer(),
                        Icon(Icons.monetization_on, color: Colors.green),
                        SizedBox(width: 5),
                        Text("₹$price"),
                      ],
                    ),
                    SizedBox(height: 20),

                    // Innovative Section
                    _buildSectionTitle("What Makes This Service Unique?"),
                    _buildFeatureList(context),

                    SizedBox(height: 20),

                    // Fix It Yourself (DIY)
                    _buildSectionTitle("Fix It Yourself"),
                    _buildDIYList(context),

                    SizedBox(height: 20),

                    // Vendors Offering Service
                    _buildSectionTitle("Vendors Offering This Service"),
                    _buildVendorList(context),

                    SizedBox(height: 20),
                    // FAQs (Updated with ExpansionTile)
                    _buildSectionTitle("FAQs"),
                    _buildFAQList(context),

                    SizedBox(height: 20),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  // Section Title
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.blueAccent,
      ),
    );
  }

  // FAQ List (Updated)
  Widget _buildFAQList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: faqs.map((faq) {
        return Card(
          color: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.grey[900]
              : AppColors.electricBlue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: ExpansionTile(
            childrenPadding: EdgeInsets.only(left: 0),
            title: Text(
              faq['question']!,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            iconColor: Colors.blueAccent,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  faq['answer']!,
                  style: TextStyle(color: Colors.white70),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // DIY Tips List (Updated)
  Widget _buildDIYList(BuildContext context) {
    return Column(
      children: diyTips.map((tip) {
        return ListTile(
          contentPadding: EdgeInsets.only(left: 0),
          leading: Icon(Icons.build, color: Colors.green),
          title: Text(
            tip,
            style: TextStyle(
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white70
                    : Colors.black,
                fontSize: 15),
          ),
        );
      }).toList(),
    );
  }

  // Unique Features List (Updated)
  Widget _buildFeatureList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: uniqueFeatures.map((feature) {
        return Card(
          elevation: 4,
          color: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.grey[900]
              : AppColors.electricBlue,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              feature,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Vendor List (Updated)
  Widget _buildVendorList(BuildContext context) {
    return Column(
      children: vendors.map((vendor) {
        return Card(
          elevation: 4,
          color: (Theme.of(context).brightness == Brightness.dark)
              ? Colors.grey[900]
              : AppColors.electricBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            leading: CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/images/nn.jpeg"),
            ),
            title: Text(
              vendor['name'],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "⭐ ${vendor['rating']} | ₹${vendor['price']}",
              style: TextStyle(color: Colors.white70),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Navigate to Vendor Details
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.red,
              ),
              child: Text("Book"),
            ),
          ),
        );
      }).toList(),
    );
  }
}
