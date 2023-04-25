import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

saveIndexRank(BuildContext context, int index) async {
  Future.delayed(Duration.zero, () {
    Provider.of<dataprovider>(context, listen: false).changeRank(index);
  });
}
