import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:transition_practice/features/start/prensetation/pages/login_page.dart';
import 'package:transition_practice/features/start/prensetation/widgets/custom_button.dart';
import 'package:transition_practice/features/start/prensetation/widgets/fade_transition_page.dart';
import 'package:transition_practice/features/start/prensetation/widgets/get_started_background.dart';

class GetStartedPage extends StatefulWidget {
  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [get_started_background(size: size), get_started_body()],
        ));
  }
}

class get_started_body extends StatefulWidget {
  const get_started_body({
    super.key,
  });

  @override
  State<get_started_body> createState() => _get_started_bodyState();
}

class _get_started_bodyState extends State<get_started_body> {
  DateTime? firstClickTime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double boxWidth = constraints.maxWidth * 0.8;
          double boxHeight = constraints.maxHeight * 0.9;
          boxWidth = boxWidth.clamp(100.0, 1000.0);
          boxHeight = boxHeight.clamp(400, 700);
          double clampedButtonHeight = (boxHeight * 0.125).clamp(50, 70);

          return SingleChildScrollView(
            child: Container(
              width: boxWidth,
              height: boxHeight,
              child: Stack(children: [
                Column(
                  children: [
                    Hero(
                      tag: 'start-login',
                      child: SizedBox(
                        width: boxWidth,
                        height: boxHeight * 0.2,
                        child: Image.asset('assets/images/logo1.png'),
                      ),
                    ),
                    SizedBox(height: boxHeight * 0.05), //spacer
                    Container(
                      width: boxWidth,
                      height: boxHeight * 0.1,
                      padding: EdgeInsets.only(right: 65),
                      child: const AutoSizeText(
                        'Manage your assets in a single system',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                        minFontSize: 20,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: boxHeight * 0.025),
                    Container(
                      width: boxWidth,
                      height: boxHeight * 0.25,
                      child: const AutoSizeText(
                        'Empower your business with the power of precision asset tracking today. Join the future of asset management with Zenzaiko!',
                        style: TextStyle(fontSize: 30),
                        minFontSize: 15,
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // SizedBox(height: boxHeight * 0.15),
                  ],
                ),
                Positioned(
                  bottom: boxHeight * 0.15,
                  right: 0,
                  left: 0,
                  child: CustomButton(
                    text: "Let's Get Started",
                    width: double.infinity,
                    height: clampedButtonHeight,
                    onTap: () {
                      Navigator.of(context)
                          .push(FadeTransitionPage(LoginPage()));
                    },
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
