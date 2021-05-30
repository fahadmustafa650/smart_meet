import 'package:flutter/material.dart';
import 'package:smart_meet/Constants/constants.dart';
import 'package:smart_meet/widgets/custom_onboarding_screen.dart';

import 'sign_up_as_screen.dart';

class OnBoardingScreens extends StatefulWidget {
  static final id = "/onboarding_screens";
  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "heading": "Share Vehicle Details",
      "image": "assets/images/car_illustration.png"
    },
    {
      "heading": "Get Registered",
      "image": "assets/images/phone _illustration.png"
    },
    {
      "heading": "Earn With qwikio",
      "image": "assets/images/card_illustration.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.only(top: 30),
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 6,
                  child: CustomOnboardingScreen(
                    imageAddress: splashData[currentPage]["image"],
                    heading: splashData[currentPage]['heading'],
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => _buildDot(index: index),
                          ),
                        ),
                        Spacer(flex: 3),
                        Spacer(),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                bottomBtn()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomBtn() {
    return currentPage >= 0 && currentPage < 2 ? nextBtn() : getStartedBtn();
  }

  Expanded getStartedBtn() {
    return Expanded(
      flex: 1,
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, SignUpAsScreen.id),
        child: Container(
          color: Colors.lightBlueAccent,
          child: Center(
              child: FittedBox(
            child: Text(
              'Lets Get Started',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'NunitoBold',
                fontSize: 24,
              ),
            ),
          )),
        ),
      ),
    );
  }

  Widget nextBtn() {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      alignment: Alignment(0.9, 0.7),
      child: TextButton(
        onPressed: () {
          if (currentPage >= 0 && currentPage < 3) {
            setState(() {
              currentPage++;
            });
          }
        },
        child: Text(
          'NEXT',
          style: TextStyle(
            // fontSize: SizeConfig.safeBlockHorizontal * 6,
            fontFamily: 'NunitoReg',
            fontWeight: FontWeight.w600,
            color: Color(0xff1D1D1D).withOpacity(0.6),
          ),
        ),
      ),
    );
  }

  AnimatedContainer _buildDot({int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 30 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.lightBlueAccent : kPrimaryColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
