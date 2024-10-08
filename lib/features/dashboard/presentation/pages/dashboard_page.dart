import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/consumable_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/home_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/profile_page.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_lifecycle.dart'; // Import the file

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
    Container(), // Placeholder for AssetLifecyclePage as it shows bottom sheet
    ProfilePage(),
  ];

  // Handle tab changes
  void _onTabTapped(int index) {
    if (index == 3) {
      // Index for AssetLifecycle tab
      AssetLifecycle.showAssetLifecycleBottomSheet(
          context); // Call the method from asset_lifecycle.dart
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext, Orientation, ScreenType) {
      return Scaffold(
        // Show the currently selected page, except when the bottom sheet is shown
        body: _pages[_selectedIndex],
        bottomNavigationBar: bottom_navigation_bar(
          currentIndex: _selectedIndex,
          onTabTapped: _onTabTapped,
        ),
      );
    });
  }
}
