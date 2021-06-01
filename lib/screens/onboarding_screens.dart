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
  List<Map<String, String>> onboardingData = [
    {
      "heading": ".Reception minus",
      "paragraph":
          "Smart Meet truly understands how important it is to maintain minimal human interactions. This is why, we have a self-service Kiosk. We take your safety as our priority!"
    },
    {
      "heading": "Run in appointment",
      "paragraph":
          "Did you forget to book an appointment? Smart Meet made it easy for you! Book a run-in appointment right now"
    },
    {
      "heading": "Temperature Detection",
      "paragraph":
          "With a COVID ridden world, its important that your body temperature is normal. Just go through Thermal Detection, so we can maintain a safer place for everyone"
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
                    //  imageAddress: splashData[currentPage]["image"],
                    heading: onboardingData[currentPage]['heading'],
                    para: onboardingData[currentPage]['paragraph'],
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
                            onboardingData.length,
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
