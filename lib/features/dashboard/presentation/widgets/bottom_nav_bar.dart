import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:transition_practice/main.dart';
import 'package:transition_practice/utility/size_utils.dart';

class bottom_navigation_bar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const bottom_navigation_bar({
    super.key,
    required this.currentIndex,
    required this.onTabTapped,
  });

  @override
  Widget build(BuildContext context) {
    return StyleProvider(
      style: Style(context),
      child: ConvexAppBar(
        height: 15 * SizeUtils.getPixelDensity(context),
        initialActiveIndex: currentIndex,
        style: TabStyle.fixed,
        backgroundColor: Colors.white,
        activeColor: customSwatch,
        color: Colors.grey,
        items: [
          TabItem(
            icon: ImageIcon(
              AssetImage('assets/images/allocation.png'),
              color: Colors.grey,
            ),
            activeIcon: ImageIcon(
              AssetImage('assets/images/allocation.png'),
              color: customSwatch,
            ),
            title: 'Assets',
          ),
          TabItem(
            icon: Image(
              image: AssetImage('assets/images/tools.png'),
              color: Colors.grey,
            ),
            activeIcon: Image(
              image: AssetImage('assets/images/tools.png'),
              color: customSwatch,
            ),
            title: 'Consumables',
          ),
          TabItem(
              icon: Image(
                image: AssetImage('assets/images/home.png'),
                color: Colors.grey,
              ),
              activeIcon: Image(
                image: AssetImage('assets/images/home.png'),
                color: customSwatch,
              ),
              title: 'Home'),
          TabItem(
              icon: Image(
                image: AssetImage('assets/images/processing.png'),
                color: Colors.grey,
              ),
              activeIcon: Image(
                image: AssetImage('assets/images/processing.png'),
                color: customSwatch,
              ),
              title: 'Asset Lifecycle'),
          TabItem(
              icon: Image(
                image: AssetImage('assets/images/person.png'),
                color: Colors.black.withOpacity(0.7),
              ),
              activeIcon: Image(
                image: AssetImage('assets/images/person.png'),
                color: customSwatch,
              ),
              title: 'Me'),
        ],
        onTap: onTabTapped,
      ),
    );
  }
}

class Style extends StyleHook {
  final BuildContext context;

  Style(this.context);

  @override
  double get activeIconSize => 12 * SizeUtils.getPixelDensity(context);

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 8 * SizeUtils.getPixelDensity(context);

  @override
  TextStyle textStyle(Color color, String? title) {
    return TextStyle(
      fontSize: 3 *
          SizeUtils.getPixelDensity(
              context), // Adjust this value to change the title text size
      color: color, // This color is passed by ConvexAppBar
    );
  }
}
