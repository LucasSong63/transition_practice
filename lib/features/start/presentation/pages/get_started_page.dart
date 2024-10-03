import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/features/start/presentation/pages/login_page.dart';
import 'package:transition_practice/features/start/presentation/widgets/custom_button.dart';
import 'package:transition_practice/features/start/presentation/widgets/fade_transition_page.dart';
import 'package:transition_practice/features/start/presentation/widgets/get_started_background.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

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
          children: [GetStartedBackground(size: size), const GetStartedBody()],
        ));
  }
}

class GetStartedBody extends StatefulWidget {
  const GetStartedBody({
    super.key,
  });

  @override
  State<GetStartedBody> createState() => _GetStartedBodyState();
}

class _GetStartedBodyState extends State<GetStartedBody> {
  DateTime? firstClickTime;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double boxWidth = 80.w.clamp(100.0, 1000.0);
          double boxHeight = 90.h.clamp(400, 700);
          double clampedButtonHeight = (boxHeight * 0.125).clamp(50, 70);

          return SingleChildScrollView(
            child: SizedBox(
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
                      padding: const EdgeInsets.only(right: 65),
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
                    SizedBox(
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
                          .push(FadeTransitionPage(const LoginPage()));
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
