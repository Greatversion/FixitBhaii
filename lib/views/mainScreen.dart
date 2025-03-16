// ignore_for_file: deprecated_member_use

import 'package:auto_route/auto_route.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart'; // AutoRoute config
import 'package:fixitbhai/utils/themes/app.colors.dart'; // App colors
import 'package:flutter/material.dart';

@RoutePage()
class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      // Pass the routes as tabs
      routes: [
        HomeRoute(),
        ServiceRoute(),
      ],
      builder: (context, child) {
        final tabRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child, // This will handle tab content automatically
          bottomNavigationBar: Container(
            color: AppColors.electricBlue,
            height: MediaQuery.of(context).size.height *
                0.07, // Bottom nav bar height
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18.0, top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Home tab button
                  SizedBox(
                    height: 35,
                    child: InkWell(
                      onTap: () {
                        tabRouter.setActiveIndex(0); // Switch to Home tab
                      },
                      child: Image.asset(
                        "assets/images/vvvvv.png", // Icon for Home tab
                        fit: BoxFit.cover,
                        color: tabRouter.activeIndex == 0
                            ? Color.fromARGB(
                                255, 253, 1, 1) // Selected tab color
                            : Colors.white, // Default color
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28, // Define height for the vertical divider
                    child: VerticalDivider(
                      color: const Color.fromARGB(
                          255, 79, 79, 79), // Color of the divider
                      thickness: 0.5, // Thickness of the divider
                      width: 0, // Space around the divider
                    ),
                  ),
                  // Services tab button
                  InkWell(
                    onTap: () {
                      tabRouter.setActiveIndex(1); // Switch to Services tab
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.miscellaneous_services_rounded,
                          color: Colors.white,
                        ),
                        Text(
                          "SERVICES", // Text for Services tab
                          style: TextStyle(
                            fontSize: tabRouter.activeIndex == 1 ? 16 : 12,
                            letterSpacing: 2.5,
                            fontWeight: FontWeight.w900,
                            color: tabRouter.activeIndex == 1
                                ? Color.fromARGB(255, 253, 1, 1)
                                : Colors.white, // Highlight selected tab
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
