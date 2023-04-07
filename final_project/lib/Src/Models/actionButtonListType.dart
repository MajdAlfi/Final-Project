import 'package:flutter/material.dart';

class actionButtonListType {
  int index;
  String name;
  IconData iconBtn;
  int pts;
  bool isSeleccted;
  actionButtonListType(
      {required this.index,
      required this.name,
      required this.pts,
      required this.isSeleccted,
      required this.iconBtn});
}
