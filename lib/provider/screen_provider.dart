import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatfromProvider extends ChangeNotifier{
  bool isios =false;
  bool isdark = true;
  bool isProfile = false;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();
  Duration duration = Duration(hours: DateTime.now().hour,minutes: DateTime.now().minute) ;

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
  void  changeCupertinotime(Duration duration)
  {
    this.duration = duration;
  }
}