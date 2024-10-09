// skeleton
import 'package:flutter/material.dart';
import 'package:transition_practice/features/dashboard/presentation/widgets/clipper_home_page.dart';
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
    print(SizeUtils.getBoxWidth(context));
    return Center(
      child: Stack(
        children: [
          ClipPath(
            clipper: WaveClipper(),
            child: Container(
              height: 250.0,
              color: Color.fromRGBO(
                  217, 253, 253, 1.0), // Background color for the wave
            ),
          ),
          Center(
            child: Column(
              children: [
                SpacerBox(SizeUtils.getBoxHeight(context) * 0.1),
                Container(
                  width: SizeUtils.getBoxWidth(context),
                  child: Row(
                    children: [
                      Text('Dashboard', textAlign: TextAlign.left),
                      //notification icon
                      Spacer(),
                      Container(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.notifications_none_outlined)),
                    ],
                  ),
                ),
                SpacerBox(10 * SizeUtils.getPixelDensity(context)),
                SearchAnchor(builder:
                    (BuildContext context, SearchController controller) {
                  return SearchBar(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0))),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                    controller: controller,
                    // onTapOutside: ,
                    padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0)),
                    onTap: () {
                      controller.openView();
                    },
                    onChanged: (_) {
                      controller.openView();
                    },
                    constraints: BoxConstraints(
                      maxWidth: SizeUtils.getBoxWidth(context),
                    ),
                    leading: const Icon(Icons.search),
                    trailing: <Widget>[
                      Tooltip(
                        message: 'Change brightness mode',
                        child: IconButton(
                          onPressed: () {
                            controller.clear();
                          },
                          icon: const Icon(
                            Icons.highlight_off_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  );
                }, suggestionsBuilder:
                    (BuildContext context, SearchController controller) {
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
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
