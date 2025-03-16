// ignore_for_file: library_private_types_in_public_api

import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:fixitbhai/utils/themes/app.dimensions.dart';
import 'package:fixitbhai/utils/themes/app.theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  _ServiceScreenState createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen>
    with SingleTickerProviderStateMixin {
  // TabController to manage the tabs
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    // Initialize the TabController with 3 tabs
    _tabController = TabController(length: 3, vsync: this);
  }

  // Dummy data for services
  final List<String> pastServices = [
    "Fix Washing Machine",
    "Repair Refrigerator",
    "Fix Air Conditioner",
  ];

  final List<String> ongoingServices = [
    "Fix Microwave",
    "Repair Laptop",
  ];

  final List<String> scheduledServices = [
    "Install AC",
    "Install Ceiling Fan",
  ];

  @override
  void dispose() {
    // Dispose the TabController when the screen is disposed
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.textPrimary,
        centerTitle: true,
        title: Text(
          "FixitBhaii Services",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        bottom: TabBar(
          splashFactory: InkRipple.splashFactory, // Disable splash effect

          indicatorColor: Colors.white,
          tabAlignment: TabAlignment.center,
          dividerColor: Colors.transparent,
          splashBorderRadius: BorderRadius.circular(5),
          labelStyle: const TextStyle(
            fontSize: 12,
            wordSpacing: 1,
            letterSpacing: 0.8,
            fontWeight: FontWeight.bold,
          ),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          tabs: const [
            InkWell(child: Tab(text: "PAST SERVICES")),
            Tab(text: "ONGOING"),
            Tab(text: "SCHEDULED SERVICES"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1 - Past Services
          ListView.builder(
            itemCount: pastServices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  pastServices[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.check_circle, color: Colors.green),
              );
            },
          ),

          // Tab 2 - Ongoing Services
          ListView.builder(
            itemCount: ongoingServices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  ongoingServices[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.sync, color: Colors.orange),
              );
            },
          ),

          // Tab 3 - Scheduled Services
          ListView.builder(
            itemCount: scheduledServices.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  scheduledServices[index],
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Icon(Icons.schedule, color: Colors.blue),
              );
            },
          ),
        ],
      ),
    );
  }
}
