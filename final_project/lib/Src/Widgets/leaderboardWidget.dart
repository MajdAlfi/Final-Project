import 'package:final_project/Src/Services/Auth/getCurrentUser.dart';
import 'package:final_project/Src/Services/Home/saveIndexRank.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class leaderboardWidget extends StatefulWidget {
  leaderboardWidget(
      {super.key,
      required this.index,
      required this.name,
      required this.pts,
      required this.uid,
      required this.myUid});
  int pts;
  String name;
  int index;
  String uid;
  String myUid;

  @override
  State<leaderboardWidget> createState() => _leaderboardWidgetState();
}

class _leaderboardWidgetState extends State<leaderboardWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.uid == widget.myUid) {
      saveIndexRank(context, widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.06,
      width: widthScr(context) * 0.9,
      decoration: BoxDecoration(
          color: (widget.uid == widget.myUid) ? mainColor() : greyColor(),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '${widget.index}       ${widget.name}',
              style: TextStyle(
                  color: (widget.uid != widget.myUid)
                      ? Colors.black87
                      : Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              '${widget.pts} Pts',
              style: TextStyle(
                  color:
                      (widget.uid != widget.myUid) ? mainColor() : Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
