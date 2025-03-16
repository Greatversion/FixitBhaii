// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/utils/reusable_widgets/divider.dart';
import 'package:fixitbhai/utils/reusable_widgets/service_dialog.dart';
import 'package:fixitbhai/utils/reusable_widgets/technician_dialog.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:fixitbhai/utils/themes/app.dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

@RoutePage()
class VendorScreen extends StatefulWidget {
  const VendorScreen({super.key});

  @override
  _VendorScreenState createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final LatLng vendorLocation = const LatLng(26.8467, 80.9462); // Lucknow

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 250.0,
            pinned: true,
            floating: false,
            backgroundColor: (Theme.of(context).brightness == Brightness.dark)
                ? AppColors.textPrimary
                : AppColors.electricBlue,
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: EdgeInsets.zero, // Removes default padding
              title: Align(
                alignment: Alignment.bottomLeft, // Ensures left alignment
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10), // Adjust left padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize:
                        MainAxisSize.min, // Prevents unnecessary extra space
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ElectroFix Solutions",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                mainAxisSize:
                                    MainAxisSize.min, // Keeps Row compact
                                children: [
                                  Text(
                                    "Hazratganj, Lucknow",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.location_on_sharp,
                                color: Color(0xffEA4335),
                                size: 40,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    "assets/images/nn.jpeg",
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
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: 100,
                  //   child: ClipRRect(
                  //     borderRadius: BorderRadius.only(
                  //         bottomLeft: Radius.circular(10),
                  //         bottomRight: Radius.circular(10)),
                  //     child: GoogleMap(
                  //       initialCameraPosition:
                  //           CameraPosition(target: vendorLocation, zoom: 14),
                  //       markers: {
                  //         Marker(
                  //             markerId: MarkerId("vendorLoc"),
                  //             position: vendorLocation)
                  //       },
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Text("Address📍",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text(
                    "Shop No. 12, XYZ Complex, Hazratganj, Lucknow",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
          ),
          mainDivider(context, text: "Owner: Mr.Lallu Lal"),
          // mainDivider(context, text: "Contact: +91 8349294924"),
          // mainDivider(text: ""),
          SliverPersistentHeader(
            pinned: true,
            delegate: _StickyTabBarDelegate(
              TabBar(
                controller: _tabController,
                splashFactory: InkRipple.splashFactory, // Disable splash effect

                indicatorColor: Colors.white,
                tabAlignment: TabAlignment.center,
                isScrollable: true,

                dividerColor: const Color.fromARGB(0, 181, 14, 14),
                splashBorderRadius: BorderRadius.circular(5),
                labelStyle: const TextStyle(
                  fontSize: 12,
                  wordSpacing: 1,
                  letterSpacing: 0.8,
                  fontWeight: FontWeight.bold,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: const [
                  Tab(icon: Icon(Icons.settings), text: "SERVICES"),
                  Tab(icon: Icon(Icons.people), text: "TECHNICIANS"),
                  Tab(icon: Icon(Icons.people), text: "AVAILABILITY"),
                  Tab(icon: Icon(Icons.image), text: "GALLERY"),
                  Tab(icon: Icon(Icons.recycling), text: "REFURBISHED"),
                  Tab(icon: Icon(Icons.star), text: "REVIEWS"),
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: const [
            ServicesTab(),
            TechniciansTab(),
            AvailabilityTab(),
            WorkGalleryTab(),
            RefurbishedTab(),
            ReviewsTab(),
          ],
        ),
      ),
    );
  }
}

class _StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  _StickyTabBarDelegate(this.tabBar);

  @override
  double get minExtent => tabBar.preferredSize.height;
  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: (Theme.of(context).brightness == Brightness.dark)
          ? AppColors.textPrimary
          : AppColors.electricBlue,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        ServiceTile("Laptop Repair", Icons.laptop),
        ServiceTile("Mobile Repair", Icons.phone_android),
        ServiceTile("AC & Fridge Repair", Icons.ac_unit),
        ServiceTile("Washing Machine Fix", Icons.local_laundry_service),
      ],
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final IconData icon;

  const ServiceTile(this.title, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: () {
          showServiceDialog(context);
        },
        leading: Icon(icon, color: Colors.blue),
        title: Text(title),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}

class ReviewsTab extends StatelessWidget {
  const ReviewsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        ReviewTile("Aman Gupta", "Excellent service!", 5),
        ReviewTile("Pooja Verma", "Very professional and affordable.", 4),
      ],
    );
  }
}

class ReviewTile extends StatelessWidget {
  final String name;
  final String review;
  final int rating;

  const ReviewTile(this.name, this.review, this.rating, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(child: Icon(Icons.person)),
        title: Text(name),
        subtitle: Text(review),
        trailing: Text("⭐ $rating"),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class RefurbishedTab extends StatelessWidget {
  const RefurbishedTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        RefurbishedItem("Refurbished Laptop - Dell Inspiron", "₹28,000",
            "assets/images/fan.jpeg"),
        RefurbishedItem(
            "Smartphone - OnePlus 8 Pro", "₹20,000", "assets/images/fan.jpeg"),
        RefurbishedItem(
            "Repaired Washing Machine", "₹15,500", "assets/images/fan.jpeg"),
      ],
    );
  }
}

class RefurbishedItem extends StatelessWidget {
  final String title, price, image;

  const RefurbishedItem(this.title, this.price, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        leading: Image.asset(image, width: 50, fit: BoxFit.contain),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(price,
            style: TextStyle(
                color: Colors.red, fontSize: 16, fontWeight: FontWeight.w600)),
        trailing: Icon(Icons.shopping_cart, color: Colors.green),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

class TechniciansTab extends StatelessWidget {
  const TechniciansTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        TechnicianTile("Rajesh Kumar", "Expert in AC & Fridge Repairs",
            "assets/images/profile_pic.png"),
        TechnicianTile("Pankaj Sharma", "Laptop & Mobile Repair Specialist",
            "assets/images/profile_pic.png"),
        TechnicianTile("Rajesh Kumar", "Expert in AC & Fridge Repairs",
            "assets/images/profile_pic.png"),
        TechnicianTile("Pankaj Sharma", "Laptop & Mobile Repair Specialist",
            "assets/images/profile_pic.png"),
        TechnicianTile("Neha Verma", "Washing Machine & Microwave Repair",
            "assets/images/profile_pic.png"),
        TechnicianTile("Neha Verma", "Washing Machine & Microwave Repair",
            "assets/images/profile_pic.png"),
      ],
    );
  }
}

class TechnicianTile extends StatelessWidget {
  final String name, expertise, image;

  const TechnicianTile(this.name, this.expertise, this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: ListTile(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => TechnicianDialog(
              technician: Technician(
                name: "Rahul Verma",
                profileImage: "assets/images/profile_pic.png",
                rating: 4.8,
                experience: 5,
                specializations: [
                  "AC Repair",
                  "Refrigerator Repair",
                  "Washing Machine"
                ],
                availability: "9 AM - 7 PM",
                phoneNumber: "+91 9876543210",
                location: "Lucknow, India",
                bio:
                    "Experienced technician with expertise in home appliance repairs.",
              ),
            ),
          );
        },
        leading: CircleAvatar(backgroundImage: AssetImage(image)),
        title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(expertise, style: TextStyle(color: Colors.grey[600])),
        trailing: Icon(Icons.phone, color: Colors.blue),
      ),
    );
  }
}
// import 'package:flutter/material.dart';

class WorkGalleryTab extends StatelessWidget {
  const WorkGalleryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: EdgeInsets.all(10),
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: [
        WorkImageTile("assets/images/r5.jpg"),
        WorkImageTile("assets/images/r1.jpg"),
        WorkImageTile("assets/images/r1.jpg"),
        WorkImageTile("assets/images/r2.jpg"),
        WorkImageTile("assets/images/r4.jpeg"),
        WorkImageTile("assets/images/r1.jpg"),
        WorkImageTile("assets/images/r2.jpg"),
        WorkImageTile("assets/images/r4.jpeg"),
        WorkImageTile("assets/images/r1.jpg"),
        WorkImageTile("assets/images/r2.jpg"),
        WorkImageTile("assets/images/r4.jpeg"),
        WorkImageTile("assets/images/r2.jpg"),
        WorkImageTile("assets/images/r1.jpg"),
        WorkImageTile("assets/images/r2.jpg"),
        WorkImageTile("assets/images/r4.jpeg"),
        WorkImageTile("assets/images/r2.jpg"),
      ],
    );
  }
}

class WorkImageTile extends StatelessWidget {
  final String image;

  const WorkImageTile(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(image, fit: BoxFit.cover),
    );
  }
}

// import 'package:flutter/material.dart';

class AvailabilityTab extends StatelessWidget {
  const AvailabilityTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        // Live Status
        Card(
          color: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: ListTile(
            leading: Icon(Icons.circle,
                color: Colors.green, size: 16), // Open/Closed Status
            title: Text("Currently Open",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            subtitle: Text("Closes at 8:00 PM",
                style: TextStyle(color: Colors.white70)),
          ),
        ),
        SizedBox(height: 10),

        // Working Hours Section
        Text("🕒 Working Hours",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
        SizedBox(height: 8),
        _buildTimeRow("Monday - Friday", "9:00 AM - 8:00 PM", context),
        _buildTimeRow("Saturday", "10:00 AM - 6:00 PM", context),
        _buildTimeRow("Sunday", "Closed", context),
        SizedBox(height: 16),

        // Upcoming Holidays
        Text("📅 Upcoming Holidays",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
        SizedBox(height: 8),
        _buildHolidayRow("March 8, 2025", "Holi Festival", context),
        _buildHolidayRow("April 14, 2025", "Ambedkar Jayanti", context),
      ],
    );
  }

  Widget _buildTimeRow(String day, String time, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(day,
              style: TextStyle(
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? Colors.white
                      : Colors.black)),
          Text(time,
              style: TextStyle(
                  color: (Theme.of(context).brightness == Brightness.dark)
                      ? Colors.white70
                      : const Color.fromARGB(168, 0, 0, 0),
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildHolidayRow(String date, String occasion, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(date,
              style: TextStyle(
                  color: (Theme.of(context).brightness == Brightness.light)
                      ? Colors.black
                      : Colors.white)),
          Text(occasion,
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
