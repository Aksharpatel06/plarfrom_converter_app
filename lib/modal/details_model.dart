import 'dart:io';

import 'package:flutter/material.dart';

class DetailsModel {
  File? img;
  String name;
  String num;
  String chats;
  DateTime dateTime;
  TimeOfDay timeOfDay;

  DetailsModel(
      {this.img,
      required this.name,
      required this.num,
      required this.chats,
      required this.dateTime,
      required this.timeOfDay});
}
