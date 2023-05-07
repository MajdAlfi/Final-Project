import 'package:final_project/Src/Models/actionButtonListType.dart';
import 'package:final_project/Src/Services/Others/languagesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<actionButtonListType> actionButtonList(language) {
  print(language);
  List<actionButtonListType> actionBtnList = [
    actionButtonListType(
        index: 0,
        name: language.tReducePaper(),
        iconBtn: Icons.cut,
        pts: 20,
        isSeleccted: false),
    actionButtonListType(
        index: 1,
        name: language.tAvoidDisposable(),
        iconBtn: Icons.stop_circle,
        pts: 30,
        isSeleccted: false),
    actionButtonListType(
        index: 2,
        name: language.tTurnOffLights(),
        iconBtn: Icons.lightbulb_outlined,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 3,
        name: language.tUseEnergySaving(),
        iconBtn: Icons.electrical_services,
        pts: 15,
        isSeleccted: false),
    actionButtonListType(
        index: 4,
        name: language.tKeepACompostBin(),
        iconBtn: Icons.delete,
        pts: 20,
        isSeleccted: false),
    actionButtonListType(
        index: 5,
        name: language.tCarpool(),
        iconBtn: Icons.drive_eta,
        pts: 25,
        isSeleccted: false),
    actionButtonListType(
        index: 6,
        name: language.tSwapBaths(),
        iconBtn: Icons.shower,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 7,
        name: language.tShop(),
        iconBtn: Icons.shopping_bag,
        pts: 15,
        isSeleccted: false),
    actionButtonListType(
        index: 8,
        name: language.tUseCloth(),
        iconBtn: Icons.receipt,
        pts: 10,
        isSeleccted: false),
    actionButtonListType(
        index: 9,
        name: language.tRepurpose(),
        iconBtn: Icons.recycling,
        pts: 20,
        isSeleccted: false),
  ];
  return actionBtnList;
}
