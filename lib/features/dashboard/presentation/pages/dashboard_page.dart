import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_lifecycle_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/consumable_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/home_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/profile_page.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/bottom_nav_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 2;

  // List of pages corresponding to each tab
  final List<Widget> _pages = [
    AssetPage(),
    ConsumablePage(),
    HomePage(), // Different from HomePage to avoid confusion
    AssetLifecyclePage(),
    ProfilePage(),
  ];

  // Handle tab changes
  void _onTabTapped(int index) {
    if (index == 3) {
      // Index for AssetLifecycle tab
      // Show bottom sheet when the AssetLifecycle tab is tapped
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 50.h, // Adjust height based on your design
            color: Colors.white,
            child: Center(
              child: Text(
                'Asset Lifecycle Bottom Sheet',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      );
    } else {
      // Change the selected index for other tabs
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext, Orientation, ScreenType) {
      return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: bottom_navigation_bar(
            currentIndex: _selectedIndex, onTabTapped: _onTabTapped),
      );
    });
  }
}
