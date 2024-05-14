import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PlatfromProvider extends ChangeNotifier{
  bool isios =false;
  bool isdark = true;
  bool isProfile = false;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  ImagePicker picker = ImagePicker();
  File? imgpath;
  File? profileimgpath;

  void changePlatfrom(bool value)
  {
    isios = value;
    notifyListeners();
  }

  void changeColor(bool value)
  {
    isdark=value;
    notifyListeners();
  }

  void profileshow(bool value)
  {
    isProfile = value;
    notifyListeners();
  }

  void changedate(DateTime dateTime)
  {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void changetime(TimeOfDay timeOfDay)
  {
    this.timeOfDay = timeOfDay;
    notifyListeners();
  }
  void  changeCupertinotime(DateTime dateTime)
  {
    this.timeOfDay = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  void setImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    imgpath = File(images!.path);
    notifyListeners();
  }

  void profileImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    profileimgpath = File(images!.path);
    notifyListeners();
  }
}