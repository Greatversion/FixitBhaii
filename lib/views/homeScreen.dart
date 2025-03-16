// ignore_for_file: deprecated_member_use

import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fixitbhai/routes/app.routes.gr.dart';
import 'package:fixitbhai/utils/reusable_widgets/divider.dart';
import 'package:fixitbhai/utils/reusable_widgets/refurbished_product_widget.dart';
import 'package:fixitbhai/utils/reusable_widgets/video_card.dart';
// import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:fixitbhai/utils/themes/app.colors.dart';
import 'package:fixitbhai/utils/themes/app.dimensions.dart';
import 'package:fixitbhai/views/profileScreen.dart';
import 'package:fixitbhai/views/searchScreen.dart';
import 'package:fixitbhai/views/vendor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gif/gif.dart';

import '../utils/reusable_widgets/service_dialog.dart';

// import 'package:overlapped_carousel/overlapped_carousel.dart';
@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List<Widget> widgets = [
    Card(
      child: Image.asset(
        'assets/images/image.jpeg', //Images stored in assets folder
        fit: BoxFit.fill,
      ),
    ),
    Card(
      child: Image.asset(
        'assets/images/image.jpeg', //Images stored in assets folder
        fit: BoxFit.fill,
      ),
    ),
    Card(
      child: Image.asset(
        'assets/images/image.jpeg', //Images stored in assets folder
        fit: BoxFit.fill,
      ),
    ),
    Card(
      child: Image.asset(
        'assets/images/image.jpeg', //Images stored in assets folder
        fit: BoxFit.fill,
      ),
    ),
    Card(
      child: Image.asset(
        'assets/images/image.jpeg', //Images stored in assets folder
        fit: BoxFit.fill,
      ),
    ),
  ];
  bool isScrolled = false;
//.............................................................GIF...............................................................................
  // late GifController _gifController;

  // @override
  // void initState() {
  //   super.initState();
  //   _gifController = GifController(vsync: this);

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     _gifController.repeat(
  //       min: 0,
  //       max: 30, // Adjust based on GIF total frames
  //       period: Duration(seconds: 5), // Slower playback (5 seconds per loop)
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      // backgroundColor: Color(0xFFFAF9F6),

      // backgroundColor:
      //     Color.fromARGB(255, 235, 235, 235), // Light gray, near white

      body: WillPopScope(
        onWillPop: () async {
          final tabRouter = AutoTabsRouter.of(context);

          if (tabRouter.activeIndex == 1) {
            tabRouter.setActiveIndex(0);
            return Future.value(false);
          } else {
            SystemNavigator.pop();
          }
          return false;
        },
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            // Ignore small offset changes caused by the carousel
            if (scrollNotification.metrics.axis == Axis.vertical &&
                scrollNotification.metrics.pixels > 100) {
              if (!isScrolled) {
                setState(() {
                  isScrolled = true;
                });
              }
            } else if (scrollNotification.metrics.axis == Axis.vertical &&
                scrollNotification.metrics.pixels <= 100) {
              if (isScrolled) {
                setState(() {
                  isScrolled = false;
                });
              }
            }
            return true;
          },
          child: Stack(
            children: [
              // Background CHANGES......................................................................
              !isScrolled
                  ? Positioned(
                      width: screenWidth,
                      height: screenHeight * .465,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30),
                        ),
                        // Background COLOR...........................................................................................
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                // Color(0xFFDC143C),
                                // Color(0xFF6A0DAD),

                                // Color.fromARGB(255, 1, 173, 155),
                                Color(0xFF041A3B),
                                Color(0xFF041A3B),
                                // Color(0xFF041A3B),

                                // Color.fromARGB(255, 132, 3, 3)
                              ], // Gold to deep red
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
//.............................................................................................GIF...........................................................................................................
                        // child: Gif(
                        //   autostart: Autostart.loop,
                        //   controller: _gifController,
                        //   image: AssetImage('assets/images/gg.gif'),
                        //   fps:
                        //       5, // **Lower FPS slows down GIF, higher FPS speeds it up**
                        // ),
//..................................................................................................IMAGE..........................................................................................................
                        // child: Image.asset(
                        //   'assets/images/newwbg.png',
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    )
                  : Container(),
              // Content Overlay

              CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.center,
                              colors: [
                            const Color.fromARGB(40, 255, 255, 255),
                            Colors.transparent,
                          ])),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 35, left: 8, right: 8, bottom: 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Home",
                                              style: TextStyle(
                                                fontFamily: "Init",
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                        Text(
                                          "632/78 A-7 Shankar Puri Colonyjjjjjjjjjjjjjjjjjjjjjjj",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                              fontSize: Dimensions.font15),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 5),
                            FilledButton(
                              style: ButtonStyle(
                                padding:
                                    WidgetStatePropertyAll(EdgeInsets.zero),
                                backgroundColor: WidgetStatePropertyAll(Colors
                                    .transparent), // Allow gradient background
                                shape: WidgetStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8), // Premium rounded edges
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Ink(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 188, 10, 10)),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(255, 253, 1, 1),
                                      Color.fromARGB(255, 132, 3, 3)
                                    ], // Gold to deep red
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Fixit ZONE",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      foreground: Paint()
                                        ..shader = LinearGradient(
                                          colors: [
                                            Colors.white,
                                            Colors.white,
                                          ], // White to Gold shimmer
                                        ).createShader(
                                            Rect.fromLTWH(0, 0, 100, 30)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Badge(
                              smallSize: 10,
                              backgroundColor:
                                  const Color.fromARGB(255, 12, 216, 19),
                              child: GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).push(ProfileRoute());
                                },
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  backgroundImage: AssetImage(
                                      "assets/images/profile_pic.png"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // SliverAppBar with sticky search bar
                  SliverAppBar(
                    backgroundColor: isScrolled
                        ? (Theme.of(context).brightness == Brightness.light)
                            ? Color(0xFFFAF9F6)
                            : Colors.black
                        : Colors.transparent, // Dynamic background color
                    pinned: true,
                    expandedHeight: 30.0,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Container(
                        color: Colors.transparent,
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(5),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, left: 8, right: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  context.router.push(SearchRoute());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                    color: (Theme.of(context).brightness ==
                                            Brightness.light)
                                        ? Colors.white24
                                        : Colors.black54,
                                    borderRadius: BorderRadius.circular(14.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4.0,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          "Search \"repair\"",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Icon(Icons.mic, color: Colors.white),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                AutoRouter.of(context).push(OffersRoute());
                              },
                              child: Image.asset(
                                "assets/images/offer.png",
                                height: 50,
                                width: 65,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Banner Section.....................................................REFURBISHED SECTIO..........................................................................................
                  SliverToBoxAdapter(
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.all(12.0),
                      child: Expanded(
                        child: RefurbishedCarousel(),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: DefaultTabController(
                      length: 3,
                      child: Column(
                        children: [
                          // Custom TabBar with rounded design
                          Container(
                            height: 40,
                            margin:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(29, 0, 0, 0),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TabBar(
                              indicatorColor: Colors.grey,
                              tabAlignment: TabAlignment.center,
                              dividerHeight: 0,
                              dividerColor: Colors.transparent,
                              splashBorderRadius: BorderRadius.circular(5),
                              labelStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.grey,
                              tabs: const [
                                Tab(text: 'Computers'),
                                Tab(text: 'Electrical'),
                                Tab(text: 'Electronics'),
                              ],
                            ),
                          ),

                          // TabBarView (Content for each tab)
                          SizedBox(
                            height: 880,
                            child: TabBarView(
                              children: [
                                // First tab content
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 205,
                                      child: Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                AutoRouter.of(context)
                                                    .push(VendorRoute());
                                              },
                                              child: buildVendorCard(
                                                  context,
                                                  "50 % OFF",
                                                  "Sumit kallu technicians ltd",
                                                  "8 km",
                                                  "20 min",
                                                  'assets/images/vendor.png'),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    mainDividerclean("CATEGORIES", context),
                                    SizedBox(
                                      height: 270,
                                      child: Expanded(
                                        child: GridView.builder(
                                          scrollDirection: Axis.horizontal,
                                          padding: const EdgeInsets.all(10),
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 16,
                                            mainAxisSpacing: 16,
                                            childAspectRatio: 1,
                                          ),
                                          itemCount: 10,
                                          itemBuilder: (context, index) {
                                            return FoodCard1(
                                              imagePath:
                                                  "assets/images/category.png",
                                              title: "Custom Pc Build",
                                              onTap: () {
                                                AutoRouter.of(context).push(
                                                    CategoryRoute(
                                                        categoryName:
                                                            "categoryName",
                                                        services: [
                                                      Service(
                                                        name: 'AC Repair',
                                                        description:
                                                            'Repair and maintenance of all air conditioning systems.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration: '1 - 2 hours',
                                                        price: 1500.0,
                                                        plans: [
                                                          'Basic Repair',
                                                          'Full Servicing',
                                                          'Emergency Support'
                                                        ],
                                                        techniciansAvailable: [
                                                          'John Doe',
                                                          'Jane Smith',
                                                          'Mike Johnson'
                                                        ],
                                                        warranty:
                                                            '6 months warranty',
                                                      ),
                                                      Service(
                                                        name: 'AC Repair',
                                                        description:
                                                            'Repair and maintenance of all air conditioning systems.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration: '1 - 2 hours',
                                                        price: 1500.0,
                                                        plans: [
                                                          'Basic Repair',
                                                          'Full Servicing',
                                                          'Emergency Support'
                                                        ],
                                                        techniciansAvailable: [
                                                          'John Doe',
                                                          'Jane Smith',
                                                          'Mike Johnson'
                                                        ],
                                                        warranty:
                                                            '6 months warranty',
                                                      ),
                                                      Service(
                                                        name: 'AC Repair',
                                                        description:
                                                            'Repair and maintenance of all air conditioning systems.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration: '1 - 2 hours',
                                                        price: 1500.0,
                                                        plans: [
                                                          'Basic Repair',
                                                          'Full Servicing',
                                                          'Emergency Support'
                                                        ],
                                                        techniciansAvailable: [
                                                          'John Doe',
                                                          'Jane Smith',
                                                          'Mike Johnson'
                                                        ],
                                                        warranty:
                                                            '6 months warranty',
                                                      ),
                                                      Service(
                                                        name: 'AC Repair',
                                                        description:
                                                            'Repair and maintenance of all air conditioning systems.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration: '1 - 2 hours',
                                                        price: 1500.0,
                                                        plans: [
                                                          'Basic Repair',
                                                          'Full Servicing',
                                                          'Emergency Support'
                                                        ],
                                                        techniciansAvailable: [
                                                          'John Doe',
                                                          'Jane Smith',
                                                          'Mike Johnson'
                                                        ],
                                                        warranty:
                                                            '6 months warranty',
                                                      ),
                                                      Service(
                                                        name: 'AC Repair',
                                                        description:
                                                            'Repair and maintenance of all air conditioning systems.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration: '1 - 2 hours',
                                                        price: 1500.0,
                                                        plans: [
                                                          'Basic Repair',
                                                          'Full Servicing',
                                                          'Emergency Support'
                                                        ],
                                                        techniciansAvailable: [
                                                          'John Doe',
                                                          'Jane Smith',
                                                          'Mike Johnson'
                                                        ],
                                                        warranty:
                                                            '6 months warranty',
                                                      ),
                                                      Service(
                                                        name: 'AC Repair',
                                                        description:
                                                            'Repair and maintenance of all air conditioning systems.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration: '1 - 2 hours',
                                                        price: 1500.0,
                                                        plans: [
                                                          'Basic Repair',
                                                          'Full Servicing',
                                                          'Emergency Support'
                                                        ],
                                                        techniciansAvailable: [
                                                          'John Doe',
                                                          'Jane Smith',
                                                          'Mike Johnson'
                                                        ],
                                                        warranty:
                                                            '6 months warranty',
                                                      ),
                                                      Service(
                                                        name:
                                                            'Washing Machine Repair',
                                                        description:
                                                            'Fixing issues related to washing machines of all brands.',
                                                        image:
                                                            'assets/images/ss.jpg', // Example image path
                                                        duration:
                                                            '45 mins - 1 hour',
                                                        price: 1000.0,
                                                        plans: [
                                                          'Standard Repair',
                                                          'Advanced Servicing'
                                                        ],
                                                        techniciansAvailable: [
                                                          'Alice Brown',
                                                          'Tom White'
                                                        ],
                                                        warranty:
                                                            '3 months warranty',
                                                      ),
                                                    ]));
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                    mainDividerclean(
                                        "SERVICES OFFERED", context),
                                    SizedBox(height: 12),
                                    SizedBox(
                                      height: 160,
                                      child: Expanded(
                                          child:
                                              HorizontalVideoList(videoUrls: [
                                        "assets/images/v1.mp4",
                                        "assets/images/v2.mp4",
                                        "assets/images/v3.mp4",
                                      ])),
                                    ),
                                    SizedBox(height: 12),
                                    mainDividerclean(
                                        "FEATURED FIXITBHAII'S", context),
                                    SizedBox(height: 12),
                                    SizedBox(
                                      height: 115,
                                      child: Expanded(
                                        child: ListView.builder(
                                          scrollDirection: Axis
                                              .horizontal, // Horizontal scroll
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          itemCount: 5,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              width:
                                                  80, // Set a fixed width for horizontal items

                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),

                                              child: Center(
                                                child: Column(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 35,
                                                      backgroundColor:
                                                          Colors.amber,
                                                      backgroundImage: AssetImage(
                                                          "assets/images/profile_pic.png"),
                                                    ),
                                                    Text(
                                                      'bhai $index',
                                                      style: TextStyle(
                                                        color: (Theme.of(
                                                                        context)
                                                                    .brightness ==
                                                                Brightness.dark)
                                                            ? Colors.white
                                                            : Colors.black,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                // Second tab content
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 150,
                                      height: 50,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      color:
                                          const Color.fromARGB(39, 54, 70, 244),
                                      child: Center(
                                        child: Text(
                                          'vendor $index',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                // Third tab content
                                ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 150,
                                      height: 50,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      color:
                                          const Color.fromARGB(39, 60, 244, 54),
                                      child: Center(
                                        child: Text(
                                          'vendor $index',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // mainDivider("CATEGORIES"),
                  // // Remaining Content
                  // SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 100,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal, // Horizontal scroll
                  //       padding: const EdgeInsets.symmetric(vertical: 10),
                  //       itemCount: 5,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           width: 80, // Set a fixed width for horizontal items
                  //           height: 60, // Adjust height as needed
                  //           margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  //           color: const Color.fromARGB(39, 244, 67, 54),
                  //           child: Center(
                  //             child: Text(
                  //               'vendor $index',
                  //               style: const TextStyle(color: Colors.white),
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // mainDivider("SERVICES OFFERED"),

                  // SliverToBoxAdapter(
                  //   child: Container(
                  //       height: 200,
                  //       color: Colors.transparent,
                  //       padding: const EdgeInsets.symmetric(vertical: 5),
                  //       child: SizedBox(
                  //         height: 100,
                  //         width: 80,
                  //         child: CarouselSlider(
                  //           options: CarouselOptions(
                  //             autoPlay: true,
                  //             enlargeFactor: 0.65,
                  //             viewportFraction: 1,
                  //             enlargeCenterPage: true,
                  //             enlargeStrategy: CenterPageEnlargeStrategy.height,
                  //           ),
                  //           items: widgets,
                  //         ),
                  //       )),
                  // ),
                  // mainDivider("FEATURED FIXITBHAII'S"),
                  // SliverToBoxAdapter(
                  //   child: SizedBox(
                  //     height: 100,
                  //     child: ListView.builder(
                  //       scrollDirection: Axis.horizontal, // Horizontal scroll
                  //       padding: const EdgeInsets.symmetric(vertical: 10),
                  //       itemCount: 5,
                  //       itemBuilder: (context, index) {
                  //         return Container(
                  //           width: 80, // Set a fixed width for horizontal items
                  //           height: 60, // Adjust height as needed
                  //           margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  //           color: const Color.fromARGB(39, 244, 67, 54),
                  //           child: Center(
                  //             child: Column(
                  //               children: [
                  //                 SizedBox(height: 5),
                  //                 CircleAvatar(),
                  //                 Text(
                  //                   'bhai $index',
                  //                   style: const TextStyle(color: Colors.white),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  mainDivider(context, text: "ALL VENDORS "),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      shrinkWrap: true, // Use unique keys
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical, // Horizontal scroll
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return VendorCard();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
