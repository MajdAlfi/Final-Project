import 'package:final_project/Src/Services/Width&Height.dart';
import 'package:final_project/Src/Services/greyColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class natureFactsWidget extends StatelessWidget {
  natureFactsWidget({super.key, required this.fact});
  String fact;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightScr(context) * 0.1,
      width: widthScr(context) * 0.85,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          color: greyColor()),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          fact,
          maxLines: 3,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
