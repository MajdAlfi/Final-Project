import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  List lott = [
    "assets/images/earth2.json",
    "assets/images/tree.json",
    "assets/images/plant.json"
  ];
  PageController _pageController = PageController();
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
                            SizedBox(
                              height: 25,
                            ),
                            Expanded(
                              child: Text(
                                "lksjdlfkjsdlkfjsl dkfjslkjfslkjflsdkjfl skdjflksd jlfksjdlfkjsdlfkjdslkfjldskjflskjlkfjslkdjlsfkjdlkfjslkjflskdjlskdjlkjlfksjldkjlfkjsdlkjflksdjflskdjlfskdjlfk",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                style: TextStyle(fontSize: 20, height: 1.5),
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () {
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    },
                    child: Text("skip"),
                  ),
                  Spacer(),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.linear);
                      },
                      icon: Icon(Icons.arrow_right),
                      label: Text("Next")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
