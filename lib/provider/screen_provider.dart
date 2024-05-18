import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../modal/details_model.dart';

class PlatfromProvider extends ChangeNotifier {
  bool isios = false;
  bool isupdate = false;
  int updateindex = 0;

  DateTime dateTime = DateTime.now();
  TimeOfDay timeOfDay = TimeOfDay.now();

  ImagePicker picker = ImagePicker();
  File? imgpath;
  File? profileimgpath;

  List<DetailsModel> callList = [];

  GlobalKey<FormState> globalKey=GlobalKey<FormState>();

  TextEditingController txtname = TextEditingController(text: 'Zimil');
  TextEditingController txtnum = TextEditingController(text: '9562596255');
  TextEditingController txtchat = TextEditingController(text: 'hello brother');

  void changePlatfrom(bool value) {
    isios = value;
    notifyListeners();
  }

  void changedate(DateTime dateTime) {
    this.dateTime = dateTime;
    notifyListeners();
  }

  void changetime(TimeOfDay timeOfDay) {
    this.timeOfDay = timeOfDay;
    notifyListeners();
  }

  void changeCupertinotime(DateTime dateTime) {
    timeOfDay = TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  void setImage() async {
    XFile? images = await picker.pickImage(source: ImageSource.camera);
    imgpath = File(images!.path);
    notifyListeners();
  }

  void calldetailsAdd(DetailsModel detailsModel) {
    callList.add(detailsModel);
    notifyListeners();
  }

  void removedetails(int index) {
    if (index >= 0 && index < callList.length) {
      callList.removeAt(index);
      print(callList.length);
    }
  }

  void back()
  {
    notifyListeners();
  }

  void editdetails({required int detailsIndex}) {
    if (detailsIndex >= 0 && detailsIndex < callList.length) {
      updateindex = detailsIndex;
      isupdate = true;
      imgpath = callList[detailsIndex].img;
      txtname = TextEditingController(text: callList[detailsIndex].name);
      txtchat = TextEditingController(text: callList[detailsIndex].chats);
      txtnum = TextEditingController(text: callList[detailsIndex].num);
      dateTime = callList[detailsIndex].dateTime;
      timeOfDay = callList[detailsIndex].timeOfDay;
      notifyListeners();
    }
  }

  void calleditdetails() {
    callList[updateindex].img = imgpath;
    callList[updateindex].name = txtname.text;
    callList[updateindex].num = txtnum.text;
    callList[updateindex].chats = txtchat.text;
    callList[updateindex].dateTime = dateTime;
    callList[updateindex].timeOfDay = timeOfDay;
    isupdate = false;
    notifyListeners();
  }
}
