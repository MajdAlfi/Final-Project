import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Services/Others/mainColor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class leaderboardWidget extends StatelessWidget {
  leaderboardWidget({
    super.key,
    required this.index,
    required this.name,
    required this.pts,
  });
  int pts;
  String name;
  int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.06,
      width: widthScr(context) * 0.9,
      decoration: BoxDecoration(
          color: greyColor(),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              '$index       $name',
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Text(
              '$pts Pts',
              style: TextStyle(
                  color: mainColor(),
                  fontSize: 17,
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
