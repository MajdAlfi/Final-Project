import 'package:final_project/Src/Services/Others/dataprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class rankSquare extends StatelessWidget {
  const rankSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      (context.watch<dataprovider>().rank == 0)
          ? ''
          : context.read<dataprovider>().rank.toString(),
      style: const TextStyle(
          color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
    );
  }
}
