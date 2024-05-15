import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';

import '../modal/details_model.dart';

class CallSaveAdaptive extends StatelessWidget {
  const CallSaveAdaptive({super.key});

  @override
  Widget build(BuildContext context) {
    if(providertrue!.isios)
      {
        return ElevatedButton(
          onPressed: () {
            DetailsModel callDetials = DetailsModel(
                img: providertrue!.imgpath!,
                name: providertrue!.txtname.text,
                num: providertrue!.txtnum.text,
                chats: providertrue!.txtchat.text,
                dateTime: providertrue!.dateTime,
                timeOfDay: providertrue!.timeOfDay);
            providerfalse!.calldetailsAdd(callDetials);

            providertrue!.imgpath = null;
            providertrue!.txtname =
                TextEditingController(text: '');
            providertrue!.txtnum =
                TextEditingController(text: '');
            providertrue!.txtchat =
                TextEditingController(text: '');
            providertrue!.dateTime = DateTime.now();
            providertrue!.timeOfDay = TimeOfDay.now();
          },
          child: Text('Save'),
        );
      }else{
      return CupertinoButton(
        child: Text('Save'),
        onPressed: () {
          DetailsModel callDetials = DetailsModel(
              img: providertrue!.imgpath!,
              name: providertrue!.txtname.text,
              num: providertrue!.txtnum.text,
              chats: providertrue!.txtchat.text,
              dateTime: providertrue!.dateTime,
              timeOfDay: providertrue!.timeOfDay);
          providerfalse!.calldetailsAdd(callDetials);

          providertrue!.imgpath = null;
          providertrue!.txtname =
              TextEditingController(text: '');
          providertrue!.txtnum =
              TextEditingController(text: '');
          providertrue!.txtchat =
              TextEditingController(text: '');
          providertrue!.dateTime = DateTime.now();
          providertrue!.timeOfDay = TimeOfDay.now();
        },
      );
    }
  }
}
