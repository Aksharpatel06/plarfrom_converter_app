import 'package:flutter/material.dart';
import 'package:plarfrom_converter_app/utils/global_variable.dart';
import 'package:provider/provider.dart';

import '../../../provider/screen_provider.dart';

TextFormField call_details_field(
    {String? label,
    TextInputType? textInputType,
    IconData? iconData,
    required TextEditingController textEditingController}) {
  return TextFormField(
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
        labelText: label,
        prefixIcon: Icon(iconData),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3),
        )),
  );
}
