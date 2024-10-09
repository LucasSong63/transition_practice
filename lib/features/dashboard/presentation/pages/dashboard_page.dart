import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/consumable_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/home_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/profile_page.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_lifecycle.dart';

class DashboardPage extends StatefulWidget {
  final bool isTablet; // Receive isTablet from main.dart

  const DashboardPage({Key? key, required this.isTablet}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 2;

  // Handle tab changes
  void _onTabTapped(int index) {
    if (index == 3) {
      // Show bottom sheet when the AssetLifecycle tab is tapped
      AssetLifecycle.showAssetLifecycleBottomSheet(context);
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // List of pages corresponding to each tab, passing the isTablet parameter
    final List<Widget> _pages = [
      AssetPage(isTablet: widget.isTablet),
      ConsumablePage(isTablet: widget.isTablet),
      HomePage(isTablet: widget.isTablet),
      Container(), // Placeholder for AssetLifecyclePage as it shows bottom sheet
      ProfilePage(isTablet: widget.isTablet),
    ];

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
