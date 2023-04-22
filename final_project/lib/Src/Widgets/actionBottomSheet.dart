import 'package:final_project/Src/Models/actionButtonListType.dart';
import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/greyColor.dart';
import 'package:final_project/Src/Widgets/groupActionButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class actionBottomSheet extends StatefulWidget {
  const actionBottomSheet({super.key});

  @override
  State<actionBottomSheet> createState() => _actionBottomSheetState();
}

class _actionBottomSheetState extends State<actionBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: heightScr(context) * 0.55,
        width: widthScr(context),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: greyColor()),
        child: ListView.separated(
            padding: const EdgeInsets.only(
                left: 20, right: 20, top: 60, bottom: 110),
            itemBuilder: (context, index) {
              return groupActionButton(
                actionBtn:
                    context.watch<dataprovider>().btnList.elementAt(index),
                index: index,
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: context.read<dataprovider>().btnList.length));
  }
}
