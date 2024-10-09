import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/clipper_home_page.dart';
import 'package:transition_practice/main.dart';
import 'package:transition_practice/utility/size_utils.dart';
import 'package:transition_practice/utility/spacer_box.dart';

class HomePage extends StatefulWidget {
  final bool isTablet;
  const HomePage({Key? key, required this.isTablet}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // Return different UI for mobile and tablet
    return widget.isTablet
        ? _buildTabletView() //
        : _buildMobileView(); //
  }

  // Placeholder for the tablet view////////////////////////////////////////////////////
  Widget _buildTabletView() {
    return Center(
      child: Text(
        'Tablet View Placeholder',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  // Mobile view (current implementation)////////////////////////////////////////////////////
  Widget _buildMobileView() {
    return Center(
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 80 * SizeUtils.getPixelDensity(context),
              color: Color.fromRGBO(
                  217, 253, 253, 1.0), // Background color for the wave
            ),
          ),
          Center(
            child: Container(
              width: SizeUtils.getBoxWidth(context),
              child: Column(
                children: [
                  SpacerBox(SizeUtils.getBoxHeight(context) * 0.1),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          'Dashboard',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: customSwatch,
                          ),
                        ),

                        Spacer(), //notification icon
                        Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SpacerBox(10 * SizeUtils.getPixelDensity(context)),
                  searchAnchor_HomePage(),
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: SizeUtils.getBoxWidth(context) * 0.2,
                              height: SizeUtils.getBoxWidth(context) * 0.2,
                              decoration: BoxDecoration(
                                color: customSwatch.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: SizeUtils.getBoxWidth(context) * 0.12,
                              width: SizeUtils.getBoxWidth(context) * 0.12,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/asset-color.png')),
                            ),
                          ),
                          Column(
                            children: [
                              SpacerBox(SizeUtils.getBoxWidth(context) * 0.28),
                              Text(
                                'Assets',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: customSwatch,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: SizeUtils.getBoxWidth(context) * 0.2,
                              height: SizeUtils.getBoxWidth(context) * 0.2,
                              decoration: BoxDecoration(
                                color: customSwatch.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: SizeUtils.getBoxWidth(context) * 0.12,
                              width: SizeUtils.getBoxWidth(context) * 0.12,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/license-color.png')),
                            ),
                          ),
                          Column(
                            children: [
                              SpacerBox(SizeUtils.getBoxWidth(context) * 0.28),
                              Text(
                                'License',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: customSwatch,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: SizeUtils.getBoxWidth(context) * 0.2,
                              height: SizeUtils.getBoxWidth(context) * 0.2,
                              decoration: BoxDecoration(
                                color: customSwatch.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: SizeUtils.getBoxWidth(context) * 0.12,
                              width: SizeUtils.getBoxWidth(context) * 0.12,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/consumables-color.png')),
                            ),
                          ),
                          Column(
                            children: [
                              SpacerBox(SizeUtils.getBoxWidth(context) * 0.28),
                              Text(
                                'Consumables',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: customSwatch,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: SizeUtils.getBoxWidth(context) * 0.2,
                              height: SizeUtils.getBoxWidth(context) * 0.2,
                              decoration: BoxDecoration(
                                color: customSwatch.withOpacity(0.1),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: SizeUtils.getBoxWidth(context) * 0.12,
                              width: SizeUtils.getBoxWidth(context) * 0.12,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/processing-color.png')),
                            ),
                          ),
                          Column(
                            children: [
                              SpacerBox(SizeUtils.getBoxWidth(context) * 0.28),
                              Text(
                                'Asset\nLifecycle',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  color: customSwatch,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

////////Search Anchor Here       ////////////////////////////////////////////////////////////////////////////////////////////////
  SearchAnchor searchAnchor_HomePage() {
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
      return SearchBar(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        controller: controller,
        padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0)),
        hintText: 'Search',
        onTap: () {},
        onChanged: (_) {},
        onTapOutside: (PointerDownEvent event) {
          FocusScope.of(context).unfocus();
        },
        constraints: BoxConstraints(
          maxWidth: SizeUtils.getBoxWidth(context) * 1.1,
        ),
        leading: Icon(
          Icons.search_outlined,
          color: customSwatch,
        ),
        trailing: <Widget>[
          Tooltip(
            message: 'Clear',
            child: IconButton(
              onPressed: () {
                controller.clear();
              },
              icon: const Icon(
                Icons.highlight_off_outlined,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );
    }, suggestionsBuilder: (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    });
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////////
