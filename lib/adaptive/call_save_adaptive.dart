import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../modal/details_model.dart';
import '../provider/screen_provider.dart';

class CallSaveAdaptive extends StatelessWidget {
  const CallSaveAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    providerfalse = Provider.of<PlatfromProvider>(context, listen: false);
    providertrue = Provider.of<PlatfromProvider>(context, listen: true);
    if (providertrue!.isios) {
      return ElevatedButton(
        onPressed: () {
          if(providertrue!.globalKey.currentState?.validate() == true)
          {
            if (providertrue!.isupdate) {
              providertrue!.calleditdetails();
            } else {
              DetailsModel callDetials = DetailsModel(
                  img: providertrue!.imgpath,
                  name: providertrue!.txtname.text,
                  num: providertrue!.txtnum.text,
                  chats: providertrue!.txtchat.text,
                  dateTime: providertrue!.dateTime,
                  timeOfDay: providertrue!.timeOfDay);
              providerfalse!.calldetailsAdd(callDetials);
            }
            providertrue!.imgpath = null;
            providertrue!.txtname = TextEditingController(text: '');
            providertrue!.txtnum = TextEditingController(text: '');
            providertrue!.txtchat = TextEditingController(text: '');
            providertrue!.dateTime = DateTime.now();
            providertrue!.timeOfDay = TimeOfDay.now();
          }
        },
        child: const Text('Save'),
      );
    } else {
      return CupertinoButton(
        child: const Text('Save'),
        onPressed: () {
          if(providertrue!.globalKey.currentState?.validate() == true)
            {
              if (providertrue!.isupdate) {
                providertrue!.calleditdetails();
              } else {
                DetailsModel callDetials = DetailsModel(
                    img: providertrue!.imgpath,
                    name: providertrue!.txtname.text,
                    num: providertrue!.txtnum.text,
                    chats: providertrue!.txtchat.text,
                    dateTime: providertrue!.dateTime,
                    timeOfDay: providertrue!.timeOfDay);
                providerfalse!.calldetailsAdd(callDetials);
              }
              providertrue!.imgpath = null;
              providertrue!.txtname = TextEditingController(text: '');
              providertrue!.txtnum = TextEditingController(text: '');
              providertrue!.txtchat = TextEditingController(text: '');
              providertrue!.dateTime = DateTime.now();
              providertrue!.timeOfDay = TimeOfDay.now();
            }
        },
      );
    }
  }
}
