import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sizer/sizer.dart';
import 'package:transition_practice/utility/custom_button.dart';
import 'package:transition_practice/features/start/presentation/widgets/get_started_background.dart';
import 'package:transition_practice/utility/size_utils.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [GetStartedBackground(), const GetStartedBody()],
            ));
      },
    );
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
    return Sizer(
      builder: (BuildContext, Orientation, ScreenType) {
        return Center(
            child: SingleChildScrollView(
          child: SizedBox(
            width: SizeUtils.getBoxWidth(context),
            height: SizeUtils.getBoxHeight(context),
            child: Stack(children: [
              Column(
                children: [
                  Hero(
                    tag: 'start-login',
                    child: SizedBox(
                      width: SizeUtils.getBoxWidth(context),
                      height: SizeUtils.getBoxHeight(context) * 0.2,
                      child: Image.asset('assets/images/logo1.png'),
                    ),
                  ),
                  SizedBox(
                      height: SizeUtils.getBoxHeight(context) * 0.05), //spacer
                  Container(
                    width: SizeUtils.getBoxWidth(context),
                    height: SizeUtils.getBoxHeight(context) * 0.1,
                    padding: const EdgeInsets.only(right: 65),
                    child: const AutoSizeText(
                      'Manage your assets in a single system',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      minFontSize: 20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: SizeUtils.getBoxHeight(context) * 0.025),
                  SizedBox(
                    width: SizeUtils.getBoxWidth(context),
                    height: SizeUtils.getBoxHeight(context) * 0.25,
                    child: const AutoSizeText(
                      'Empower your business with the power of precision asset tracking today. Join the future of asset management with Zenzaiko!',
                      style: TextStyle(
                        fontSize: 23,
                        letterSpacing: 0,
                        wordSpacing: 0,
                        fontWeight: FontWeight.w500,
                      ),
                      minFontSize: 14,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // SizedBox(height: boxHeight * 0.15),
                ],
              ),
              Positioned(
                bottom: SizeUtils.getBoxHeight(context) * 0.15,
                right: 0,
                left: 0,
                child: CustomButton(
                  text: "Let's Get Started",
                  width: double.infinity,
                  height: SizeUtils.getClampedButtonHeight(context),
                  onTap: () {
                    context.push('/login');
                  },
                ),
              ),
            ]),
          ),
        ));
      },
    );
  }
}
