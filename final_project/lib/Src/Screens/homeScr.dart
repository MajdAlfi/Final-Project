import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/greyColor.dart';
import 'package:final_project/Src/Services/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultProject.dart';
import 'package:final_project/Src/Widgets/natureFactsWidget.dart';
import 'package:final_project/Src/Widgets/showBottomSheetActionProject.dart';
import 'package:flutter/material.dart';

class homeScr extends StatelessWidget {
  homeScr({super.key});
  String fact =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nisi velit, cursus a posuere a, dapibus ut turpis. Nulla et eleifend enim. Nullam vitae ligula tempor, pretium erat non, mattis ante. Nullam vitae cursus purus, eu feugiat lectus. Nullam non accumsan magna. Aliquam sed ornare enim, eget viverra risus.';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor(),
      body: Stack(
        children: [
          Positioned(
              top: heightScr(context) * 0.09,
              left: widthScr(context) * 0.1,
              child: const Text(
                'Majd Alfi',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
              )),
          Positioned(
              top: heightScr(context) * 0.125,
              left: widthScr(context) * 0.1,
              child: const Text(
                'desc',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w300),
              )),
          Positioned(
              top: heightScr(context) * 0.15,
              left: widthScr(context) * 0.2,
              child: const Text(
                '20',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
              top: heightScr(context) * 0.1755,
              left: widthScr(context) * 0.35,
              child: const Text(
                'Points',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w300),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: heightScr(context) * 0.66,
              width: widthScr(context),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: heightScr(context) * 0.08,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Nature Facts',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.03,
                    ),
                    Container(
                      height: heightScr(context) * 0.1,
                      width: widthScr(context),
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            natureFactsWidget(fact: fact),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.03,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Top Projects',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightScr(context) * 0.03,
                    ),
                    Container(
                      height: heightScr(context) * 0.31,
                      child: ListView.separated(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) =>
                            defaultProject(context, 'Plant Trees'),
                        // Container(
                        //   color: greyColor(),
                        //   height: heightScr(context) * 0.25,
                        //   width: widthScr(context) * 0.85,
                        // ),
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 10,
                        ),
                        itemCount: 10,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              top: heightScr(context) * 0.05,
              right: -20,
              child: SizedBox(
                  height: heightScr(context) * 0.3,
                  width: widthScr(context) * 0.6,
                  child: Image.asset('assets/images/tree.png'))),
        ],
      ),
    );
  }
}
