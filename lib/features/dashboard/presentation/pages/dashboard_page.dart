import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/consumable_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/home_page.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/profile_page.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/bottom_nav_bar.dart';
import 'package:transition_practice/features/dashboard/presentation/pages/asset_lifecycle.dart';
import 'package:transition_practice/utility/size_utils.dart'; // Import the file

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 2;
  double? screenWidth; // Store screen width

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Retrieve the screen width once and store it in the state
      setState(() {
        screenWidth =
            SizeUtils.getBoxWidth(context); // Get screen width using SizeUtils
      });
    });
  }

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
    // Wait until screen width is available (after the first frame is rendered)
    if (screenWidth == null) {
      return Center(
          child:
              CircularProgressIndicator()); // Show loading spinner while waiting for screen width
    }

    // Determine if the device is a tablet (width > 600)
    bool isTablet = screenWidth! > 600;

    // List of pages corresponding to each tab, passing the isTablet parameter
    final List<Widget> _pages = [
      AssetPage(isTablet: isTablet),
      ConsumablePage(isTablet: isTablet),
      HomePage(isTablet: isTablet),
      Container(), // Placeholder for AssetLifecyclePage as it shows bottom sheet
      ProfilePage(isTablet: isTablet),
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
