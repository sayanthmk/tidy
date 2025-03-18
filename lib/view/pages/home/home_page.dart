import 'package:flutter/material.dart';
import 'package:serviceapp/constants/color.dart';
import 'package:serviceapp/view/pages/clean_service.dart/cleaning_services.dart';
import 'package:serviceapp/view/pages/home/cleaning_service.dart';
import 'package:serviceapp/view/pages/home/header_section.dart';
import 'package:serviceapp/view/pages/home/services_items_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderSection(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Image.asset(
                          'assets/image8.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 10,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search for a service',
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400),
                                  border: InputBorder.none,
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              gradient: TidyColors.primarybuttongradient,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Available Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 16),
                        AvailableServiceItemsSection(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Cleaning Services',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const CleaningServicesDetailScreen(),
                                ));
                              },
                              child: Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green.shade400,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: 14, color: Colors.green.shade400),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const CleaningServiceSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}












        // Positioned(
            //   bottom: 20,
            //   left: 0,
            //   right: 0,
            //   child: Center(
            //     child: Container(
            //       height: 70,
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(10),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black.withOpacity(0.1),
            //             blurRadius: 10,
            //             spreadRadius: 1,
            //             offset: const Offset(0, 1),
            //           ),
            //         ],
            //       ),
            //       child: Row(
            //         mainAxisSize: MainAxisSize.min,
            //         children: [
            //           NavItem(
            //             index: 0,
            //             icon: Icons.home,
            //             label: "Home",
            //             isSelected: true,
            //             onTap: () {},
            //           ),
            //           const SizedBox(width: 24),
            //           NavItem(
            //             index: 0,
            //             icon: Icons.calendar_today,
            //             label: "Bookings",
            //             isSelected: false,
            //             onTap: () {},
            //           ),
            //           const SizedBox(width: 24),
            //           NavItem(
            //             index: 0,
            //             icon: Icons.person,
            //             label: "Account",
            //             isSelected: false,
            //             onTap: () {
            //               Navigator.of(context).push(MaterialPageRoute(
            //                 builder: (context) => AccountProfilePage(),
            //               ));
            //             },
            //           ),
            //           const SizedBox(width: 24),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),