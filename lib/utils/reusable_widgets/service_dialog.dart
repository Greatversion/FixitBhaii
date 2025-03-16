import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart';
import 'package:fixitbhai/utils/reusable_widgets/divider.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:fixitbhai/views/serviceDisplayScreen.dart';
import 'package:flutter/material.dart';
import 'package:fixitbhai/utils/reusable_widgets/divider.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:flutter/material.dart';

class ServiceDialog extends StatelessWidget {
  final String serviceCategory;
  final List<Service> services;

  ServiceDialog({required this.serviceCategory, required this.services});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.85, // 90% of screen width
        height:
            MediaQuery.of(context).size.height * 0.85, // 85% of screen height
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: AppColors.backgroundDark,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  serviceCategory,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            mainDividerclean("" , context),

            // Service List Section
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 4.0,
                    color: AppColors.textPrimary,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Service image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.asset(
                              service.image,
                              width: double.infinity,
                              height: 150.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 10.0),

                          // Service name and description
                          Row(
                            children: [
                              Icon(Icons.build, color: Colors.blueAccent),
                              SizedBox(width: 8.0),
                              Text(
                                service.name,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0),
                          Text(
                            service.description,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: const Color.fromARGB(255, 240, 237, 237),
                            ),
                          ),
                          SizedBox(height: 12.0),

                          // Service details
                          Row(
                            children: [
                              Icon(Icons.access_time,
                                  size: 18.0, color: Colors.blueAccent),
                              SizedBox(width: 8.0),
                              Text(
                                'Duration: ${service.duration}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0),
                          Row(
                            children: [
                              Icon(Icons.monetization_on,
                                  size: 18.0, color: Colors.green),
                              SizedBox(width: 8.0),
                              Text(
                                'Pricing: ₹${service.price}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),

                          // Available Plans
                          Text(
                            'Available Plans:',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          ...service.plans.map(
                            (plan) => Padding(
                              padding: const EdgeInsets.only(top: 5.0),
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle,
                                      color: Colors.green, size: 18.0),
                                  SizedBox(width: 8.0),
                                  Text(
                                    plan,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),

                          // Call to Action Button
                          ElevatedButton(
                            onPressed: () {
                              // Handle the booking action

                              Navigator.of(context).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 253, 1, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 14.0, horizontal: 10),
                            ),
                            child: Text(
                              'Book Service Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 🛠 Function to Show the Generated Dialog
void showGeneratedDialog(
    BuildContext context, String category, List<Service> services) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "",
    transitionDuration: Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Align(
        alignment: Alignment.center,
        child: ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutBack, // Smooth pop-up effect
          ),
          child: ServiceDialog(
            serviceCategory: category,
            services: services,
          ),
        ),
      );
    },
  );
}

class Service {
  final String name;
  final String description;
  final String image;
  final String duration;
  final double price;
  final List<String> plans;
  final List<String> techniciansAvailable;
  final String? warranty;

  Service({
    required this.name,
    required this.description,
    required this.image,
    required this.duration,
    required this.price,
    required this.plans,
    required this.techniciansAvailable,
    this.warranty,
  });
}

void showServiceDialog(BuildContext context) {
  final services = [
    Service(
      name: 'AC Repair',
      description: 'Repair and maintenance of all air conditioning systems.',
      image: 'assets/images/ss.jpg', // Example image path
      duration: '1 - 2 hours',
      price: 1500.0,
      plans: ['Basic Repair', 'Full Servicing', 'Emergency Support'],
      techniciansAvailable: ['John Doe', 'Jane Smith', 'Mike Johnson'],
      warranty: '6 months warranty',
    ),
    Service(
      name: 'Washing Machine Repair',
      description: 'Fixing issues related to washing machines of all brands.',
      image: 'assets/images/ss.jpg', // Example image path
      duration: '45 mins - 1 hour',
      price: 1000.0,
      plans: ['Standard Repair', 'Advanced Servicing'],
      techniciansAvailable: ['Alice Brown', 'Tom White'],
      warranty: '3 months warranty',
    ),
  ];

  showDialog(
    context: context,
    builder: (context) {
      return ServiceDialog(
        serviceCategory: 'Home Appliance Repair',
        services: services,
      );
    },
  );
}
