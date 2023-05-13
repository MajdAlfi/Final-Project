import 'package:final_project/Src/Screens/firstUI.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  List lott = [
    "assets/images/earth2.json",
    "assets/images/tree.json",
    "assets/images/plant.json"
  ];

  PageController _pageController = PageController();

  List txt = [
    'Welcome!! We are glad to have you here looking forward for you to use the app :)',
    'The apps goal is to broaden the people intersted in saving the planet',
    'Enjoy using the app with a touch of competitiveness over achieve your goals and save the planet without further do... lets get started!'
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                child:
                                    Lottie.asset(lott[index], fit: BoxFit.fill),
                              ),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            Expanded(
                              child: Center(
                                child: Text(
                                  txt.elementAt(index),
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.visible,
                                  style: TextStyle(fontSize: 20, height: 1.5),
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
            ),
            SmoothPageIndicator(
              controller: _pageController,
              count: 3,
              effect: WormEffect(activeDotColor: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => firstUI()));
                    },
                    child: Text(Provider.of<languages>(context).tSkip()),
                  ),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        if (selectedIndex == 2) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => firstUI()));
                        } else {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }
                        setState(() {
                          selectedIndex += 1;
                        });
                      },
                      icon: Icon(Icons.arrow_right),
                      label: (selectedIndex < 2)
                          ? Text(Provider.of<languages>(context).tNext())
                          : Text(Provider.of<languages>(context).tFinish())),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
