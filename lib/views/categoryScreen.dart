import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';

import '../utils/reusable_widgets/service_dialog.dart';

@RoutePage()
class CategoryScreen extends StatelessWidget {
  final String categoryName;
  final List<Service> services;

  const CategoryScreen({
    super.key,
    required this.categoryName,
    required this.services,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          categoryName,
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
                // color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: IconThemeData(color: Theme.of(context).iconTheme.color),
        elevation: 3,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: services.isEmpty
            ? Center(
                child: Text(
                  "No services available in this category",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 16,
                  ),
                ),
              )
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // 2 services per row
                  childAspectRatio: 0.80,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return GestureDetector(
                    onTap: () {
                      AutoRouter.of(context).push(
                        ServiceDisplayRoute(
                          serviceName: "AC Repair",
                          serviceImage: "assets/images/ss.jpg",
                          description:
                              "Get your AC fixed at affordable prices by experts.Get your AC fixed at affordable prices by experts.Get your AC fixed at affordable prices by experts.Get your AC fixed at affordable prices by experts.",
                          duration: "1-2 hours",
                          price: 499.0,
                          faqs: [
                            {
                              "question": "Do you provide warranty?",
                              "answer": "Yes, 6 months on parts."
                            },
                            {
                              "question": "Can I cancel after booking?",
                              "answer": "Yes, within 24 hours."
                            },
                          ],
                          diyTips: [
                            "Clean the air filters regularly.",
                            "Check for any ice build-up in the unit."
                          ],
                          uniqueFeatures: [
                            "24/7 service availability",
                            "Expert certified technicians",
                            "Eco-friendly solutions"
                          ],
                          vendors: [
                            {
                              "name": "FixIt Experts",
                              "image": "assets/images/vendor1.jpg",
                              "rating": 4.5,
                              "price": 499
                            },
                            {
                              "name": "Quick Repair",
                              "image": "assets/images/vendor2.jpg",
                              "rating": 4.8,
                              "price": 599
                            }
                          ],
                        ),
                      );
                    },
                    child: Card(
                      color: Theme.of(context).cardTheme.color,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      elevation: 4.0,
                      child: SizedBox(
                        height: 80,
                        width: double.maxFinite,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Service Image
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(
                                  service.image,
                                  width: double.infinity,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(height: 6.0),

                              // Service Name
                              Text(
                                service.name,
                                maxLines: 1, // Limits to 1 line
                                overflow: TextOverflow.ellipsis, // Adds "..."
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              SizedBox(height: 2.0),

                              // Service Description
                              Text(
                                service.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                      fontSize: 12.0,
                                      color: (Theme.of(context).brightness ==
                                              Brightness.dark)
                                          ? Colors.white70
                                          : Colors.black,
                                    ),
                              ),
                              SizedBox(height: 4.0),

                              // Price & Button
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "₹${service.price}",
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Open Booking Dialog
                                      AutoRouter.of(context).push(
                                        ServiceDisplayRoute(
                                          serviceName: "AC Repair",
                                          serviceImage: "assets/images/ss.jpg",
                                          description:
                                              "Get your AC fixed at affordable prices by experts.Get your AC fixed at affordable prices by experts.Get your AC fixed at affordable prices by experts.Get your AC fixed at affordable prices by experts.",
                                          duration: "1-2 hours",
                                          price: 499.0,
                                          faqs: [
                                            {
                                              "question":
                                                  "Do you provide warranty?",
                                              "answer":
                                                  "Yes, 6 months on parts."
                                            },
                                            {
                                              "question":
                                                  "Can I cancel after booking?",
                                              "answer": "Yes, within 24 hours."
                                            },
                                          ],
                                          diyTips: [
                                            "Clean the air filters regularly.",
                                            "Check for any ice build-up in the unit."
                                          ],
                                          uniqueFeatures: [
                                            "24/7 service availability",
                                            "Expert certified technicians",
                                            "Eco-friendly solutions"
                                          ],
                                          vendors: [
                                            {
                                              "name": "FixIt Experts",
                                              "image":
                                                  "assets/images/vendor1.jpg",
                                              "rating": 4.5,
                                              "price": 499
                                            },
                                            {
                                              "name": "Quick Repair",
                                              "image":
                                                  "assets/images/vendor2.jpg",
                                              "rating": 4.8,
                                              "price": 599
                                            }
                                          ],
                                        ),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          Color.fromARGB(255, 253, 1, 1),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 2),
                                    ),
                                    child: Text(
                                      "Book",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
