import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:serviceapp/controller/bottm_nav_controller.dart';
import 'package:serviceapp/view/pages/home/home_page.dart';
import 'package:serviceapp/view/pages/profile/my_account.dart';

class TestPageBottom extends StatelessWidget {
  const TestPageBottom({super.key});

  static const List<IconData> _unselectedIcons = [
    Icons.home_outlined,
    Icons.calendar_month_outlined,
    Icons.person_outline,
  ];

  static const List<IconData> _selectedIcons = [
    Icons.home_filled,
    Icons.calendar_month,
    Icons.person,
  ];

  static const List<String> _tabNames = ['Home', 'Bookings', 'Account'];

  static final List<Widget> _tabPages = [
    const HomePage(),
    const HomePage(),
    const AccountProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: _NavigationScaffold(
        tabPages: _tabPages,
        selectedIcons: _selectedIcons,
        unselectedIcons: _unselectedIcons,
        tabNames: _tabNames,
      ),
    );
  }
}

class _NavigationScaffold extends StatelessWidget {
  final List<Widget> tabPages;
  final List<IconData> selectedIcons;
  final List<IconData> unselectedIcons;
  final List<String> tabNames;

  const _NavigationScaffold({
    required this.tabPages,
    required this.selectedIcons,
    required this.unselectedIcons,
    required this.tabNames,
  });

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.currentIndex;

    return Scaffold(
      body: Stack(
        children: [
          IndexedStack(
            index: currentIndex,
            children: tabPages,
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(unselectedIcons.length, (index) {
                    final isSelected = currentIndex == index;

                    return GestureDetector(
                      onTap: () => navigationProvider.setIndex(index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: isSelected ? Colors.green[100] : Colors.white,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isSelected
                                  ? selectedIcons[index]
                                  : unselectedIcons[index],
                              color: isSelected ? Colors.green : Colors.grey,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              tabNames[index],
                              style: TextStyle(
                                color: isSelected ? Colors.black : Colors.grey,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//   Widget _buildTabItem(
//     BuildContext context,
//     int index,
//     int currentIndex,
//     NavigationProvider provider,
//   ) {
//     final isSelected = currentIndex == index;

//     return GestureDetector(
//       onTap: () => provider.setIndex(index),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: isSelected ? Colors.green[100] : Colors.white,
//         ),
//         child: Row(
//           children: [
//             Icon(
//               // Use different icons based on selection state
//               isSelected ? selectedIcons[index] : unselectedIcons[index],
//               color: isSelected ? Colors.green : Colors.grey,
//             ),
//             const SizedBox(width: 3),
//             Text(
//               tabNames[index],
//               style: TextStyle(
//                 color: isSelected ? Colors.black : Colors.grey,
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
