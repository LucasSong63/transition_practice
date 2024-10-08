// skeleton
import 'package:flutter/material.dart';
import 'package:transition_practice/utility/size_utils.dart';
import 'package:transition_practice/utility/spacer_box.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Column(
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
