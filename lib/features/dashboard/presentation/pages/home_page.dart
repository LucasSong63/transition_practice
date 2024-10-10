import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/clipper_home_page.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/indicator.dart';
import 'package:transition_practice/main.dart';
import 'package:transition_practice/utility/size_utils.dart';
import 'package:transition_practice/utility/spacer_box.dart';
import 'package:fl_chart/fl_chart.dart';

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
    ////////////////////////////////////////////////////
    List<FlSpot> spots = [
      FlSpot(1, 95),
      FlSpot(2, 80),
      FlSpot(3, 60),
      FlSpot(4, 82),
      FlSpot(5, 90),
      FlSpot(6, 70),
      FlSpot(7, 20),
    ];
//// line chart maxX always plus 1////
    double maxX =
        spots.map((spot) => spot.x).reduce((a, b) => a > b ? a : b) + 1;
    ////////////////////////////////////////////////////
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
                              fontSize: 20.sp,
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
                    SpacerBox(8 * SizeUtils.getStaticPixelDensity()),
                    //////////////////Search Bar Here///////////////////////////////////////////////////////
                    searchAnchor_HomePage(),
                    //////////////////////Four Image button start here///////////////////////////////////////////////////
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
                                  color: customSwatch.withOpacity(0.05),
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
                                  color: customSwatch.withOpacity(0.05),
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
                                  color: customSwatch.withOpacity(0.05),
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
                                  color: customSwatch.withOpacity(0.05),
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
                    ////////////////////Four Image Button End here/////////////////////////////////////////////////////
                    SpacerBox(10 * SizeUtils.getStaticPixelDensity()),
                    ////////////////////Four square widget start here/////////////////////////////////////////////////////
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
                                    fontSize: 17.sp,
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
                                      fontSize: 21.sp,
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
                                    fontSize: 17.sp,
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
                                      fontSize: 21.sp,
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
                          height: SizeUtils.getStaticBoxWidth() * 0.48,
                          decoration: BoxDecoration(
                            color: secondarySwatch.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                child: Text(
                                  'Total \nConsumables',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: 'Alef',
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 10),
                                child: Text('10',
                                    style: TextStyle(
                                      fontSize: 21.sp,
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
                        Spacer(), ////////////////////////////////////////////////////////////////////////////////////////////////////
                        Container(
                          width: SizeUtils.getStaticBoxWidth() * 0.48,
                          height: SizeUtils.getStaticBoxWidth() * 0.48,
                          decoration: BoxDecoration(
                            color: secondarySwatch.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.only(left: 10, top: 20),
                                child: Text(
                                  'Current Assets Value',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: 'Alef',
                                    letterSpacing: 0,
                                    wordSpacing: 0,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height:
                                          SizeUtils.getStaticBoxWidth() * 0.22,
                                      width:
                                          SizeUtils.getStaticBoxWidth() * 0.22,
                                      // padding: const EdgeInsets.only(left: 10),
                                      child: PieChart(
                                        PieChartData(
                                          sections: [
                                            PieChartSectionData(
                                              color: customSwatch,
                                              value: 25,
                                              title: 'Flutter',
                                              showTitle: false,
                                              radius: 7,
                                            ),
                                            PieChartSectionData(
                                              color: Colors.blue,
                                              value: 20,
                                              title: 'React',
                                              showTitle: false,
                                              radius: 7,
                                            ),
                                            PieChartSectionData(
                                              color: Colors.green,
                                              value: 10,
                                              title: 'Xamarin',
                                              showTitle: false,
                                              radius: 7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Indicator(
                                            color: customSwatch,
                                            text: 'Flutter',
                                            textsize: 14.sp,
                                            isSquare: false,
                                            size: 10.sp,
                                          ),
                                          Indicator(
                                            color: Colors.blue,
                                            text: 'React',
                                            textsize: 14.sp,
                                            isSquare: false,
                                            size: 10.sp,
                                          ),
                                          Indicator(
                                            color: Colors.green,
                                            text: 'Xamarin',
                                            textsize: 14.sp,
                                            isSquare: false,
                                            size: 10.sp,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    //////////////////////////Four Square Widget End Here//////////////////////////////////////////////////////////////////////////////////////////////
                    SpacerBox(8 * SizeUtils.getStaticPixelDensity()),
                    ///////////////////////////Line Chart Start Here//////////////////////////////////////////////////////////////////////////////////////////////
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Text(
                            "Consumables Expenses",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.sp,
                              letterSpacing: 0,
                              wordSpacing: 0,
                            ),
                          ),
                        ),
                        Container(
                          height: 9 * SizeUtils.getStaticPixelDensity(),
                          width: 23 * SizeUtils.getStaticPixelDensity(),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withOpacity(0.5),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton<String>(
                            underline: Container(),
                            dropdownColor: Colors.white,
                            value: '2024',
                            onChanged: (String? newValue) {},
                            items: <String>['2024', '2023', '2022']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: SizeUtils.getStaticBoxWidth(),
                      padding: const EdgeInsets.only(top: 10),
                      child: CustomPaint(
                        painter: LineWithIndentPainter(),
                      ),
                    ),
                    SpacerBox(8 * SizeUtils.getStaticPixelDensity()),
                    Stack(
                      children: [
                        Container(
                          height: 70 * SizeUtils.getStaticPixelDensity(),
                          child: LineChart(
                            LineChartData(
                              lineBarsData: [
                                LineChartBarData(
                                  spots: spots,
                                  color: Colors.lightGreen,
                                  isCurved: true,
                                  curveSmoothness: 0.3,
                                ),
                              ],
                              titlesData: FlTitlesData(
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    getTitlesWidget: bottomTitleWidgets,
                                  ),
                                ),
                              ),
                              minY: 0,
                              maxY: 100,
                              minX: 0,
                              maxX: maxX,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SpacerBox(SizeUtils.getStaticBoxHeight() * 2),
          ],
        ),
      ),
    );
  }

  ////////////////////
  ////////////////////////////////////////
  ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

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

class LineWithIndentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width - SizeUtils.getStaticBoxWidth() * 0.36,
        0); // Line to the middle
    path.relativeLineTo(size.width - SizeUtils.getStaticBoxWidth() * 0.97,
        -10); // Small diagonal indent
    path.relativeLineTo(size.width - SizeUtils.getStaticBoxWidth() * 0.67,
        0); // Return to the original height
    // Return to the original height

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////
Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('JAN', style: style);
      break;
    case 2:
      text = const Text('FEB', style: style);
      break;
    case 3:
      text = const Text('MAR', style: style);
      break;
    case 4:
      text = const Text('APR', style: style);
      break;
    case 5:
      text = const Text('MAY', style: style);
      break;
    case 6:
      text = const Text('JUN', style: style);
      break;
    case 7:
      text = const Text('JUL', style: style);
      break;
    case 8:
      text = const Text('AUG', style: style);
      break;
    case 9:
      text = const Text('SEPT', style: style);
      break;
    case 10:
      text = const Text('OCT', style: style);
      break;
    case 11:
      text = const Text('NOV', style: style);
      break;
    case 12:
      text = const Text('DEC', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}
