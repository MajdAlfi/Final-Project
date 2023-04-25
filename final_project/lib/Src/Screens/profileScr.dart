import 'package:d_chart/d_chart.dart';
import 'package:final_project/Src/Screens/supportedProjects.dart';
import 'package:final_project/Src/Screens/yourProjectsScr.dart';
import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Home/analysisPoints.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:final_project/Src/Widgets/defaultElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Widgets/defaultShowPoints.dart';

class ProfileScr extends StatefulWidget {
  const ProfileScr({super.key});

  @override
  State<ProfileScr> createState() => _ProfileScrState();
}

class _ProfileScrState extends State<ProfileScr> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    analysisPoints(context).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainColor(),
        body: (context.watch<dataprovider>().userData == null)
            ? const Center(
                child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ))
            : Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Container(
                    height: heightScr(context),
                    color: mainColor(),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: heightScr(context) * 0.05,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 45,
                                backgroundImage:
                                    Provider.of<dataprovider>(context)
                                                    .userData!
                                                    .profileIMG! !=
                                                "" &&
                                            Provider.of<dataprovider>(context)
                                                    .userData!
                                                    .profileIMG! !=
                                                null
                                        ? NetworkImage(
                                            Provider.of<dataprovider>(context)
                                                .userData!
                                                .profileIMG!)
                                        : const AssetImage(
                                            "assets/images/defaultProfileImage.jpg",
                                          ) as ImageProvider,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context
                                          .read<dataprovider>()
                                          .userData!
                                          .name
                                          .toString(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      Provider.of<dataprovider>(context,
                                              listen: false)
                                          .userData!
                                          .desc
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.8),
                                          fontSize: 16),
                                    )
                                  ],
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Provider.of<dataprovider>(context,
                                          listen: false)
                                      .signOut(context);
                                },
                                icon: const Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: heightScr(context) * 0.015,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Goal",
                                style: TextStyle(color: Colors.white),
                              ),
                              const Spacer(),
                              Text(
                                Provider.of<dataprovider>(
                                  context,
                                ).userData!.goal.toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Container(
                            height: 10,
                            child: DChartSingleBar(
                              radius: BorderRadius.circular(15),
                              forgroundColor: Colors.white,
                              value: (context
                                      .watch<dataprovider>()
                                      .listPoints
                                      .where((element) =>
                                          DateFormat('dd MMM \n yyyy')
                                              .format(element.gainedOn) ==
                                          DateFormat('dd MMM \n yyyy')
                                              .format(DateTime.now()))
                                      .isNotEmpty)
                                  ? context
                                      .watch<dataprovider>()
                                      .listPoints
                                      .where((element) =>
                                          DateFormat('dd MMM \n yyyy')
                                              .format(element.gainedOn) ==
                                          DateFormat('dd MMM \n yyyy')
                                              .format(DateTime.now()))
                                      .elementAt(0)
                                      .points
                                      .toDouble()
                                  : 0,
                              max: Provider.of<dataprovider>(
                                context,
                              ).userData!.goal!.toDouble(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightScr(context) * 0.015,
                  ),
                  Container(
                    width: widthScr(context),
                    padding: const EdgeInsets.all(10),
                    height: heightScr(context) * 0.65,
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(250, 250, 250, 1),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              defaultShowPoints(
                                  context,
                                  Provider.of<dataprovider>(
                                    context,
                                  ).userData!.points!,
                                  "Total Point"),
                              defaultShowPoints(
                                  context,
                                  Provider.of<dataprovider>(
                                    context,
                                  ).userData!.actionsCompleted!,
                                  "Action Completed"),
                              defaultShowPoints(
                                  context,
                                  Provider.of<dataprovider>(
                                    context,
                                  ).userData!.supportedProjects!.length,
                                  "Supported Project"),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              !anonymousCheck()
                                  ? Expanded(
                                      child: defaultElevatedButton(
                                          context, "Your Projects", () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => yourProject(
                                                      Provider.of<dataprovider>(
                                                    context,
                                                  ).userData!.yourProject!)));
                                    }))
                                  : SizedBox(),
                              SizedBox(
                                width: anonymousCheck() ? 0 : 10,
                              ),
                              Expanded(
                                  child: defaultElevatedButton(
                                      context, "Supported Projects", () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SupportedProject(
                                                Provider.of<dataprovider>(
                                              context,
                                            ).userData!.supportedProjects!)));
                              })),
                            ],
                          ),
                          // TableCalendar(
                          //   firstDay: DateTime.utc(2010, 10, 16),
                          //   lastDay: DateTime.utc(2030, 3, 14),
                          //   focusedDay: DateTime.now(),
                          // ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              height: 150,
                              child: (context
                                          .watch<dataprovider>()
                                          .listPoints
                                          .isEmpty &&
                                      context
                                              .read<dataprovider>()
                                              .userData!
                                              .points ==
                                          0)
                                  ? (context
                                              .read<dataprovider>()
                                              .userData!
                                              .points ==
                                          0)
                                      ? const Center(
                                          child: Text(
                                            'Please gain points to show analysis!',
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 15),
                                          ),
                                        )
                                      : Container(
                                          height: heightScr(context) * 0.6,
                                          width: widthScr(context),
                                          child: const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        )
                                  : Container(
                                      height: heightScr(context) * 0.2,
                                      width: widthScr(context) * 0.9,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(30)),
                                          color: greyColor()),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: DChartBar(
                                          animate: true,
                                          data: [
                                            {
                                              'id': 'Bar',
                                              'data': List.generate(
                                                (context
                                                            .read<
                                                                dataprovider>()
                                                            .listPoints
                                                            .length >
                                                        7)
                                                    ? 7
                                                    : context
                                                        .read<dataprovider>()
                                                        .listPoints
                                                        .length,
                                                (index) => {
                                                  'domain':
                                                      "${DateFormat('dd MMM \n yyyy').format(context.read<dataprovider>().listPoints.elementAt(index).gainedOn)}",
                                                  'measure': context
                                                      .read<dataprovider>()
                                                      .listPoints
                                                      .elementAt(index)
                                                      .points
                                                },
                                              )
                                            },
                                          ],
                                          barColor:
                                              (Map<String, dynamic> barData,
                                                  int? index, String id) {
                                            return Colors.green;
                                          },
                                        ),
                                      ),
                                    ))
                        ],
                      ),
                    ),
                  )
                ],
              ));
  }
}
