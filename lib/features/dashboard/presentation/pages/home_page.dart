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
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                height: 80 * SizeUtils.getStaticPixelDensity(),
                color: Color.fromRGBO(
                    217, 253, 253, 1.0), // Background color for the wave
              ),
            ),
            Center(
              child: Container(
                width: SizeUtils.getStaticBoxWidth(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SpacerBox(SizeUtils.getStaticBoxHeight() * 0.1),
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
                    SpacerBox(10 * SizeUtils.getStaticPixelDensity()),
                    /////////////////////////////////////////////////////////////////////////
                    searchAnchor_HomePage(),
                    /////////////////////////////////////////////////////////////////////////
                    Row(
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: SizeUtils.getStaticBoxWidth() * 0.2,
                                height: SizeUtils.getStaticBoxWidth() * 0.2,
                                decoration: BoxDecoration(
                                  color: customSwatch.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: SizeUtils.getStaticBoxWidth() * 0.12,
                                width: SizeUtils.getStaticBoxWidth() * 0.12,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/asset-color.png')),
                              ),
                            ),
                            Column(
                              children: [
                                SpacerBox(SizeUtils.getStaticBoxWidth() * 0.28),
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
                                width: SizeUtils.getStaticBoxWidth() * 0.2,
                                height: SizeUtils.getStaticBoxWidth() * 0.2,
                                decoration: BoxDecoration(
                                  color: customSwatch.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: SizeUtils.getStaticBoxWidth() * 0.12,
                                width: SizeUtils.getStaticBoxWidth() * 0.12,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/license-color.png')),
                              ),
                            ),
                            Column(
                              children: [
                                SpacerBox(SizeUtils.getStaticBoxWidth() * 0.28),
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
                                width: SizeUtils.getStaticBoxWidth() * 0.2,
                                height: SizeUtils.getStaticBoxWidth() * 0.2,
                                decoration: BoxDecoration(
                                  color: customSwatch.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: SizeUtils.getStaticBoxWidth() * 0.12,
                                width: SizeUtils.getStaticBoxWidth() * 0.12,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/consumables-color.png')),
                              ),
                            ),
                            Column(
                              children: [
                                SpacerBox(SizeUtils.getStaticBoxWidth() * 0.28),
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
                                width: SizeUtils.getStaticBoxWidth() * 0.2,
                                height: SizeUtils.getStaticBoxWidth() * 0.2,
                                decoration: BoxDecoration(
                                  color: customSwatch.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: SizeUtils.getStaticBoxWidth() * 0.12,
                                width: SizeUtils.getStaticBoxWidth() * 0.12,
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/processing-color.png')),
                              ),
                            ),
                            Column(
                              children: [
                                SpacerBox(SizeUtils.getStaticBoxWidth() * 0.28),
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
                    ),
                    /////////////////////////////////////////////////////////////////////////
                    SpacerBox(20 * SizeUtils.getStaticPixelDensity()),
                    Row(
                      children: [
                        Container(
                          width: SizeUtils.getStaticBoxWidth() * 0.48,
                          height: SizeUtils.getStaticBoxWidth() * 0.25,
                          decoration: BoxDecoration(
                            color: secondarySwatch.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Total Assets',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Alef',
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('25',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Alef',
                                      color: Color.fromRGBO(29, 111, 137, 1.0),
                                      letterSpacing: 0,
                                      wordSpacing: 0,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: SizeUtils.getStaticBoxWidth() * 0.48,
                          height: SizeUtils.getStaticBoxWidth() * 0.25,
                          decoration: BoxDecoration(
                            color: secondarySwatch.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Total Licenses',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Alef',
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('20',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Alef',
                                      color: Color.fromRGBO(29, 111, 137, 1.0),
                                      letterSpacing: 0,
                                      wordSpacing: 0,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    /////////////////////////////////////////////////////////////////////////
                    SpacerBox(2 * SizeUtils.getStaticPixelDensity()),
                    Row(
                      children: [
                        Container(
                          width: SizeUtils.getStaticBoxWidth() * 0.48,
                          height: SizeUtils.getStaticBoxWidth() * 0.4,
                          decoration: BoxDecoration(
                            color: secondarySwatch.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Total Assets',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Alef',
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('25',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Alef',
                                      color: Color.fromRGBO(29, 111, 137, 1.0),
                                      letterSpacing: 0,
                                      wordSpacing: 0,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: SizeUtils.getStaticBoxWidth() * 0.48,
                          height: SizeUtils.getStaticBoxWidth() * 0.25,
                          decoration: BoxDecoration(
                            color: secondarySwatch.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  'Total Licenses',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: 'Alef',
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text('20',
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Alef',
                                      color: Color.fromRGBO(29, 111, 137, 1.0),
                                      letterSpacing: 0,
                                      wordSpacing: 0,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

////////Search Anchor Here       ////////////////////////////////////////////////////////////////////////////////////////////////
  SearchAnchor searchAnchor_HomePage() {
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
      return SearchBar(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        backgroundColor: WidgetStateProperty.all(Colors.white),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        controller: controller,
        padding: const WidgetStatePropertyAll<EdgeInsets>(
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
