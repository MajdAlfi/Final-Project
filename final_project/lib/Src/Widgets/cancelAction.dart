import 'package:final_project/Src/Services/Others/Width&Height.dart';
import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class cancelAction extends StatelessWidget {
  const cancelAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        width: widthScr(context) * 0.27,
        height: heightScr(context) * 0.045,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: TextButton(
          onPressed: () {
            for (int i = 0; i < 10; i++) {
              Provider.of<dataprovider>(context, listen: false)
                  .changeIsSelectedGroupBtn(false, i);
            }
            Navigator.pop(context);
          },
          child: Text(
            Provider.of<languages>(context).tCancel(),
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
      ),
    );
  }
}
