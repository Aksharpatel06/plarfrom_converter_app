import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';


Widget call_details_field(
    {String? label,
    TextInputType? textInputType,
    IconData? iconData,
    required TextEditingController textEditingController}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 4),
    child: Row(
      children: [
        Icon(iconData),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextFormField(
            controller: textEditingController,
            keyboardType: textInputType,
            textInputAction: TextInputAction.next,
            validator: (value) {
              if (textEditingController==providertrue!.txtname) {
                if(providertrue!.txtname.text.isEmpty)
                {
                  return 'Please enter the name';
                }
              } else if (textEditingController == providertrue!.txtnum) {
                if (providertrue!.txtnum.text.length != 10) {
                  return 'Enter the correct number';
                }
              } else if(textEditingController==providertrue!.txtchat)
              {
                if (providertrue!.txtchat.text.isEmpty) {
                  return 'Please enter the chats';
                }
              }
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                hintText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(3),
                )),
          ),
        ),
      ],
    ),
  );
}
