import 'package:flutter/cupertino.dart';

class PlatfromProvider extends ChangeNotifier{
  bool isIos =false;
  bool isdark = true;

  void changePlatfrom(bool value)
  {
    isIos = value;
    notifyListeners();
  }

  void changeColor(bool value)
  {
    isdark=value;
    notifyListeners();
  }
}